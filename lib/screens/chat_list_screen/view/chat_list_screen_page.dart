import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_grpc/bootstrap.dart';
import 'package:flutter_grpc/generated/protos/chat.pbgrpc.dart';
import 'package:flutter_grpc/screens/chat_list_screen/chat_list_screen.dart';

class ChatListScreenPage extends StatelessWidget {
  const ChatListScreenPage({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatListScreenBloc(channel: getIt())
        ..add(ConnectChatStream(userId: userId)),
      child: ChatListScreenView(
        userId: userId,
      ),
    );
  }
}

class ChatListScreenView extends StatefulWidget {
  const ChatListScreenView({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  State<ChatListScreenView> createState() => _ChatListScreenViewState();
}

class _ChatListScreenViewState extends State<ChatListScreenView> {
  final messageTxtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.userId} Chats'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocSelector<ChatListScreenBloc, ChatListScreenState,
                List<ChatMessage>>(
              selector: (state) {
                return state.messages;
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final message = state[index];
                    final isServer = message.userId == 'SERVER';

                    if (isServer) {
                      return ListTile(
                        title: Text(
                          message.content,
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          message.userId,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (message.userId == widget.userId) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),

                          //
                          const SizedBox(height: 4),
                        ],
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.userId,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary
                                          .withAlpha(169),
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                message.content,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),

                        //
                        const SizedBox(height: 4),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageTxtCtrl,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Type message here',
                    ),
                  ),
                ),

                //
                IconButton(
                  onPressed: () {
                    if (messageTxtCtrl.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Message cannot be empty'),
                        ),
                      );
                      return;
                    }

                    final message = ChatMessage()
                      ..userId = widget.userId
                      ..content = messageTxtCtrl.text.trim()
                      ..timestamp =
                          DateTime.now().millisecondsSinceEpoch.toString();

                    context
                        .read<ChatListScreenBloc>()
                        .add(SendMessage(message: message));

                    messageTxtCtrl.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
