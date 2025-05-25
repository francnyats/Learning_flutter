import 'package:chat_app_2/main.dart';
import 'package:chat_app_2/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = supabase.auth.currentUser!.id;

    return StreamBuilder(
      stream: supabase
          .from('chat')
          .stream(primaryKey: ['id']).order('created_at', ascending: false),
      builder: (ctx, chatSnapshots) {
        if (chatSnapshots.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text('No messages found'),
          );
        }

        if (!chatSnapshots.hasData || chatSnapshots.data!.isEmpty) {
          return const Center(
            child: Text('No messages found'),
          );
        }
        if (chatSnapshots.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        final loadedMessages = chatSnapshots.data!;

        return ListView.builder(
            padding: const EdgeInsets.only(left: 30, bottom: 40, right: 30),
            reverse: true,
            itemCount: loadedMessages.length,
            itemBuilder: (ctx, index) {
              final message = loadedMessages[index];
              final nextMessage = index + 1 < loadedMessages.length
                  ? loadedMessages[index + 1]
                  : null;

              final currentMessageUserId = message['userId'];
              final nextMessageUserId =
                  nextMessage != null ? nextMessage['userId'] : null;
              final nextUserIsSame = nextMessageUserId == currentMessageUserId;

              if (nextUserIsSame) {
                return MessageBubble.next(
                    message: message['text'],
                    isMe: authenticatedUser == currentMessageUserId);
              } else {
                return MessageBubble.first(
                    userImage: message['userImage'],
                    username: message['username'],
                    message: message['text'],
                    isMe: authenticatedUser == currentMessageUserId);
              }
            });
      },
    );
  }
}
