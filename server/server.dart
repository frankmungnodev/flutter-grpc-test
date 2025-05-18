// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:flutter_grpc/generated/protos/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart' as grpc;

/// Main function to start the server
void main() async {
  const port = 8080;
  final server = ChatServer(port);
  await server.start();

  // Keep the server running until terminated
  await ProcessSignal.sigint.watch().first;
  await server.stop();
}

/// A gRPC chat server implementation that handles multiple clients
/// and broadcasts messages between them.
class ChatServer {
  ChatServer(this.port) {
    _server = grpc.Server.create(
      services: [
        ChatServiceImpl(),
      ],
    );
  }
  final int port;
  late final grpc.Server _server;

  /// Starts the gRPC server
  Future<void> start() async {
    await _server.serve(port: port);
    print('Server started, listening on $port');
  }

  /// Stops the gRPC server
  Future<void> stop() async {
    await _server.shutdown();
    print('Server shut down');
  }
}

/// Implementation of the ChatService defined in the proto file
class ChatServiceImpl extends ChatServiceBase {
  /// Store chat message history
  final List<ChatMessage> messageHistory = [];

  /// Keep track of active client streams
  final Map<String, StreamController<ChatResponse>> activeClients = {};

  @override
  Stream<ChatResponse> chatStream(
    grpc.ServiceCall call,
    Stream<ChatMessage> requests,
  ) async* {
    // Create a controller for this client's response stream
    final responseController = StreamController<ChatResponse>();
    var userId = '';
    var userIdentified = false;

    // Listen to incoming messages from this client
    final subscription = requests.listen(
      (message) async {
        if (!userIdentified) {
          // First message should contain the user ID
          if (message.userId.isEmpty) {
            // Send an error message if user ID is missing
            final errorMessage = ErrorMessage()
              ..errorCode = 'MISSING_USER_ID'
              ..errorMessage = 'First message must contain a user ID'
              ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

            final response = ChatResponse()..error = errorMessage;
            responseController.add(response);
            return; // Don't process further until we get a valid user ID
          }

          // Valid user ID received
          userId = message.userId;
          userIdentified = true;
          activeClients[userId] = responseController;
          print('$userId joined the chat');

          // Send join notification to all clients
          final joinMessage = ChatMessage()
            ..userId = 'SERVER'
            ..content = '$userId has joined the chat'
            ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

          final joinResponse = ChatResponse()..message = joinMessage;
          await broadcast(joinResponse);

          // Send chat history to new user
          await sendHistory(userId);

          // If the first message also had content, process it
          if (message.content.isNotEmpty) {
            final newMessage = ChatMessage()
              ..userId = userId
              ..content = message.content
              ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

            messageHistory.add(newMessage);
            final response = ChatResponse()..message = newMessage;
            await broadcast(response);
          }
        } else {
          // Validate message content
          if (message.content.isEmpty) {
            // Send an error message for empty content
            final errorMessage = ErrorMessage()
              ..errorCode = 'EMPTY_CONTENT'
              ..errorMessage = 'Message cannot be empty'
              ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

            final response = ChatResponse()..error = errorMessage;
            final clientController = activeClients[userId];
            if (clientController != null) {
              clientController.add(response);
            }
            return;
          }

          // Process regular chat message
          final newMessage = ChatMessage()
            ..userId = message.userId.isEmpty
                ? userId
                : message.userId // Use stored userId if empty
            ..content = message.content
            ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

          messageHistory.add(newMessage);
          final response = ChatResponse()..message = newMessage;
          await broadcast(response);
        }
      },
      onDone: () async {
        // Clean up when the client disconnects
        if (userId.isNotEmpty) {
          activeClients.remove(userId);
          print('$userId left the chat');

          // Send leave notification to all clients
          final leaveMessage = ChatMessage()
            ..userId = 'SERVER'
            ..content = '$userId has left the chat'
            ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

          final leaveResponse = ChatResponse()..message = leaveMessage;
          await broadcast(leaveResponse);
        }

        // Close the client's response stream
        await responseController.close();
      },
      onError: (dynamic error) {
        print('Error from client $userId: $error');
        activeClients.remove(userId);
        responseController.close();
      },
    );

    // Yield all messages sent to this client's response stream
    yield* responseController.stream;

    // Clean up the subscription when the stream is done
    await subscription.cancel();
  }

  @override
  Future<MessageAck> sendMessage(
    grpc.ServiceCall call,
    ChatMessage request,
  ) async {
    // Handle missing user ID
    if (request.userId.isEmpty) {
      return MessageAck()
        ..received = false
        ..serverMessage = 'Missing user ID'
        ..timestamp = DateTime.now().millisecondsSinceEpoch.toString()
        ..error = (ErrorMessage()
          ..errorCode = 'MISSING_USER_ID'
          ..errorMessage = 'User ID is required'
          ..timestamp = DateTime.now().millisecondsSinceEpoch.toString());
    }

    // Handle empty content
    if (request.content.isEmpty) {
      return MessageAck()
        ..received = false
        ..serverMessage = 'Empty message'
        ..timestamp = DateTime.now().millisecondsSinceEpoch.toString()
        ..error = (ErrorMessage()
          ..errorCode = 'EMPTY_CONTENT'
          ..errorMessage = 'Message content cannot be empty'
          ..timestamp = DateTime.now().millisecondsSinceEpoch.toString());
    }

    final newMessage = ChatMessage()
      ..userId = request.userId
      ..content = request.content
      ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();

    messageHistory.add(newMessage);
    final response = ChatResponse()..message = newMessage;
    await broadcast(response);

    return MessageAck()
      ..received = true
      ..serverMessage = 'Message broadcast to ${activeClients.length} users'
      ..timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Sends the message history to a specific user
  Future<void> sendHistory(String userId) async {
    final controller = activeClients[userId];
    if (controller == null) return;

    for (final message in messageHistory) {
      try {
        final historyResponse = ChatResponse()..message = message;
        controller.add(historyResponse);
      } catch (e) {
        print('Error sending history to $userId: $e');
      }
    }
  }

  /// Broadcasts a message to all connected clients
  Future<void> broadcast(ChatResponse response) async {
    for (final entry in activeClients.entries) {
      final clientId = entry.key;
      final controller = entry.value;

      try {
        controller.add(response);
      } catch (e) {
        print('Error broadcasting to $clientId: $e');
        // Don't remove client here as it might cause concurrent modification
        // issues
        // The client will be removed when its stream closes
      }
    }
  }
}
