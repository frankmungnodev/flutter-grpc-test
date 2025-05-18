//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatResponseDescriptor instead')
const ChatResponse$json = {
  '1': 'ChatResponse',
  '2': [
    {
      '1': 'message',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.chat.ChatMessage',
      '9': 0,
      '10': 'message'
    },
    {
      '1': 'error',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.chat.ErrorMessage',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'response'},
  ],
};

/// Descriptor for `ChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatResponseDescriptor = $convert.base64Decode(
    'CgxDaGF0UmVzcG9uc2USLQoHbWVzc2FnZRgBIAEoCzIRLmNoYXQuQ2hhdE1lc3NhZ2VIAFIHbW'
    'Vzc2FnZRIqCgVlcnJvchgCIAEoCzISLmNoYXQuRXJyb3JNZXNzYWdlSABSBWVycm9yQgoKCHJl'
    'c3BvbnNl');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGAoHY29udGVudBgCIAEoCV'
    'IHY29udGVudBIcCgl0aW1lc3RhbXAYAyABKAlSCXRpbWVzdGFtcA==');

@$core.Deprecated('Use errorMessageDescriptor instead')
const ErrorMessage$json = {
  '1': 'ErrorMessage',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
  ],
};

/// Descriptor for `ErrorMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorMessageDescriptor = $convert.base64Decode(
    'CgxFcnJvck1lc3NhZ2USHQoKZXJyb3JfY29kZRgBIAEoCVIJZXJyb3JDb2RlEiMKDWVycm9yX2'
    '1lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZRIcCgl0aW1lc3RhbXAYAyABKAlSCXRpbWVzdGFt'
    'cA==');

@$core.Deprecated('Use messageAckDescriptor instead')
const MessageAck$json = {
  '1': 'MessageAck',
  '2': [
    {'1': 'received', '3': 1, '4': 1, '5': 8, '10': 'received'},
    {'1': 'server_message', '3': 2, '4': 1, '5': 9, '10': 'serverMessage'},
    {'1': 'timestamp', '3': 3, '4': 1, '5': 9, '10': 'timestamp'},
    {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.chat.ErrorMessage',
      '10': 'error'
    },
  ],
};

/// Descriptor for `MessageAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageAckDescriptor = $convert.base64Decode(
    'CgpNZXNzYWdlQWNrEhoKCHJlY2VpdmVkGAEgASgIUghyZWNlaXZlZBIlCg5zZXJ2ZXJfbWVzc2'
    'FnZRgCIAEoCVINc2VydmVyTWVzc2FnZRIcCgl0aW1lc3RhbXAYAyABKAlSCXRpbWVzdGFtcBIo'
    'CgVlcnJvchgEIAEoCzISLmNoYXQuRXJyb3JNZXNzYWdlUgVlcnJvcg==');
