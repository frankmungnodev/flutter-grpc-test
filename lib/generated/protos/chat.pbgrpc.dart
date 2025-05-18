//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:flutter_grpc/generated/protos/chat.pb.dart' as $0;
import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

export 'chat.pb.dart';

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  ChatServiceClient(super.channel, {super.options, super.interceptors});
  static final _$chatStream =
      $grpc.ClientMethod<$0.ChatMessage, $0.ChatResponse>(
    '/chat.ChatService/ChatStream',
    ($0.ChatMessage value) => value.writeToBuffer(),
    $0.ChatResponse.fromBuffer,
  );
  static final _$sendMessage =
      $grpc.ClientMethod<$0.ChatMessage, $0.MessageAck>(
    '/chat.ChatService/SendMessage',
    ($0.ChatMessage value) => value.writeToBuffer(),
    $0.MessageAck.fromBuffer,
  );

  $grpc.ResponseStream<$0.ChatResponse> chatStream(
    $async.Stream<$0.ChatMessage> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$chatStream, request, options: options);
  }

  $grpc.ResponseFuture<$0.MessageAck> sendMessage(
    $0.ChatMessage request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  ChatServiceBase() {
    $addMethod(
      $grpc.ServiceMethod<$0.ChatMessage, $0.ChatResponse>(
        'ChatStream',
        chatStream,
        true,
        true,
        $0.ChatMessage.fromBuffer,
        ($0.ChatResponse value) => value.writeToBuffer(),
      ),
    );
    $addMethod(
      $grpc.ServiceMethod<$0.ChatMessage, $0.MessageAck>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        $0.ChatMessage.fromBuffer,
        ($0.MessageAck value) => value.writeToBuffer(),
      ),
    );
  }
  $core.String get $name => 'chat.ChatService';

  $async.Future<$0.MessageAck> sendMessage_Pre(
    $grpc.ServiceCall $call,
    $async.Future<$0.ChatMessage> $request,
  ) async {
    return sendMessage($call, await $request);
  }

  $async.Stream<$0.ChatResponse> chatStream(
    $grpc.ServiceCall call,
    $async.Stream<$0.ChatMessage> request,
  );
  $async.Future<$0.MessageAck> sendMessage(
    $grpc.ServiceCall call,
    $0.ChatMessage request,
  );
}
