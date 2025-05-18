//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum ChatResponse_Response { message, error, notSet }

/// ChatResponse is a wrapper that can contain either a ChatMessage or ErrorMessage
class ChatResponse extends $pb.GeneratedMessage {
  factory ChatResponse({
    ChatMessage? message,
    ErrorMessage? error,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  ChatResponse._() : super();
  factory ChatResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChatResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChatResponse_Response>
      _ChatResponse_ResponseByTag = {
    1: ChatResponse_Response.message,
    2: ChatResponse_Response.error,
    0: ChatResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ChatMessage>(1, _omitFieldNames ? '' : 'message',
        subBuilder: ChatMessage.create)
    ..aOM<ErrorMessage>(2, _omitFieldNames ? '' : 'error',
        subBuilder: ErrorMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChatResponse clone() => ChatResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChatResponse copyWith(void Function(ChatResponse) updates) =>
      super.copyWith((message) => updates(message as ChatResponse))
          as ChatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatResponse create() => ChatResponse._();
  ChatResponse createEmptyInstance() => create();
  static $pb.PbList<ChatResponse> createRepeated() =>
      $pb.PbList<ChatResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatResponse>(create);
  static ChatResponse? _defaultInstance;

  ChatResponse_Response whichResponse() =>
      _ChatResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ChatMessage get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(ChatMessage v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
  @$pb.TagNumber(1)
  ChatMessage ensureMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  ErrorMessage get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(ErrorMessage v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);
  @$pb.TagNumber(2)
  ErrorMessage ensureError() => $_ensure(1);
}

class ChatMessage extends $pb.GeneratedMessage {
  factory ChatMessage({
    $core.String? userId,
    $core.String? content,
    $core.String? timestamp,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  ChatMessage._() : super();
  factory ChatMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChatMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) =>
      super.copyWith((message) => updates(message as ChatMessage))
          as ChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get timestamp => $_getSZ(2);
  @$pb.TagNumber(3)
  set timestamp($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

class ErrorMessage extends $pb.GeneratedMessage {
  factory ErrorMessage({
    $core.String? errorCode,
    $core.String? errorMessage,
    $core.String? timestamp,
  }) {
    final $result = create();
    if (errorCode != null) {
      $result.errorCode = errorCode;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  ErrorMessage._() : super();
  factory ErrorMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'errorCode')
    ..aOS(2, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(3, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorMessage clone() => ErrorMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorMessage copyWith(void Function(ErrorMessage) updates) =>
      super.copyWith((message) => updates(message as ErrorMessage))
          as ErrorMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ErrorMessage create() => ErrorMessage._();
  ErrorMessage createEmptyInstance() => create();
  static $pb.PbList<ErrorMessage> createRepeated() =>
      $pb.PbList<ErrorMessage>();
  @$core.pragma('dart2js:noInline')
  static ErrorMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ErrorMessage>(create);
  static ErrorMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get timestamp => $_getSZ(2);
  @$pb.TagNumber(3)
  set timestamp($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);
}

class MessageAck extends $pb.GeneratedMessage {
  factory MessageAck({
    $core.bool? received,
    $core.String? serverMessage,
    $core.String? timestamp,
    ErrorMessage? error,
  }) {
    final $result = create();
    if (received != null) {
      $result.received = received;
    }
    if (serverMessage != null) {
      $result.serverMessage = serverMessage;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  MessageAck._() : super();
  factory MessageAck.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MessageAck.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageAck',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'received')
    ..aOS(2, _omitFieldNames ? '' : 'serverMessage')
    ..aOS(3, _omitFieldNames ? '' : 'timestamp')
    ..aOM<ErrorMessage>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ErrorMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MessageAck clone() => MessageAck()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MessageAck copyWith(void Function(MessageAck) updates) =>
      super.copyWith((message) => updates(message as MessageAck)) as MessageAck;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageAck create() => MessageAck._();
  MessageAck createEmptyInstance() => create();
  static $pb.PbList<MessageAck> createRepeated() => $pb.PbList<MessageAck>();
  @$core.pragma('dart2js:noInline')
  static MessageAck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageAck>(create);
  static MessageAck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get received => $_getBF(0);
  @$pb.TagNumber(1)
  set received($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReceived() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceived() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverMessage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasServerMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get timestamp => $_getSZ(2);
  @$pb.TagNumber(3)
  set timestamp($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimestamp() => $_clearField(3);

  /// Add an optional error field for failed message sends
  @$pb.TagNumber(4)
  ErrorMessage get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ErrorMessage v) {
    $_setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ErrorMessage ensureError() => $_ensure(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
