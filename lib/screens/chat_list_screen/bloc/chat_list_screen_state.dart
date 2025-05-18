// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_list_screen_bloc.dart';

class ChatListScreenState extends Equatable {
  const ChatListScreenState({
    this.messages = const [],
    this.error,
  });

  final List<ChatMessage> messages;
  final String? error;

  @override
  List<Object?> get props => [
        messages,
        error,
      ];

  ChatListScreenState copyWith({
    List<ChatMessage>? messages,
    String? error,
  }) {
    return ChatListScreenState(
      messages: messages ?? this.messages,
      error: error,
    );
  }
}
