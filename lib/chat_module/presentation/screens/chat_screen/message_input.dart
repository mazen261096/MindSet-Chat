import 'package:flutter/material.dart';
import '../../../../auth_module/domain/entities/user.dart';
import '../../../../auth_module/presentation/controller/auth_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../../domain/entities/message.dart';
import '../../controller/chat_bloc.dart';
import '../../controller/chat_events.dart';

class MessageInput extends StatelessWidget {
  final AppUser receiverUser;

  MessageInput({super.key, required this.receiverUser});
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(BuildContext context) {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final senderUser = sl<AuthBloc>().state.appUser!;
    final message = Message(
      id: '',
      senderId: senderUser.id,
      receiverId: receiverUser.id,
      text: text,
      timestamp: DateTime.now(),
    );

    sl<ChatBloc>().add(SendMessageEvent(message: message, context: context));
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blueAccent),
            onPressed: () {
              _sendMessage(context);
            },
          ),
        ],
      ),
    );
  }
}
