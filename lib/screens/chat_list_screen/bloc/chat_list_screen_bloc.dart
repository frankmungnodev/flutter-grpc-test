import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_grpc/generated/protos/chat.pbgrpc.dart';
import 'package:grpc/grpc.dart';

part 'chat_list_screen_event.dart';
part 'chat_list_screen_state.dart';

class ChatListScreenBloc
    extends Bloc<ChatListScreenEvent, ChatListScreenState> {
  ChatListScreenBloc({
    required ClientChannel channel,
  })  : _channel = channel,
        super(const ChatListScreenState()) {
    on<ConnectChatStream>(_connectChatStream);
    on<SendMessage>(_sendMessage);
  }

  final ClientChannel _channel;
  final StreamController<ChatMessage> myChatStream = StreamController();

  @override
  Future<void> close() async {
    await myChatStream.close();
    return super.close();
  }

  FutureOr<void> _connectChatStream(
    ConnectChatStream event,
    Emitter<ChatListScreenState> emit,
  ) async {
    myChatStream.add(ChatMessage()..userId = event.userId);

    await emit.forEach(
      ChatServiceClient(_channel).chatStream(myChatStream.stream),
      onData: (chatResponse) {
        log('ConnectChatStream response => $chatResponse');
        if (chatResponse.error.errorMessage.isNotEmpty) {
          return state.copyWith(
            error: chatResponse.error.errorMessage,
          );
        }

        final newList = List<ChatMessage>.from(state.messages)
          ..add(chatResponse.message);
        return state.copyWith(messages: newList);
      },
      onError: (error, stackTrace) {
        log(
          'ConnectChatStream error => ',
          error: error,
          stackTrace: stackTrace,
        );

        return state;
      },
    );
  }

  FutureOr<void> _sendMessage(
    SendMessage event,
    Emitter<ChatListScreenState> emit,
  ) async {
    myChatStream.add(event.message);
  }
}
