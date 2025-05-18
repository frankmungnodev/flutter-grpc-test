part of 'chat_list_screen_bloc.dart';

sealed class ChatListScreenEvent extends Equatable {
  const ChatListScreenEvent();

  @override
  List<Object> get props => [];
}

class ConnectChatStream extends ChatListScreenEvent {
  const ConnectChatStream({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class SendMessage extends ChatListScreenEvent {
  const SendMessage({
    required this.message,
  });

  final ChatMessage message;

  @override
  List<Object> get props => [message];
}
