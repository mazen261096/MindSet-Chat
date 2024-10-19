import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth_module/presentation/controller/auth_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/message.dart';
import '../../controller/chat_bloc.dart';
import '../../controller/chat_states.dart';
import 'message_bubble.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ChatBloc, ChatStates>(
      builder: (context, state) {
        if (state.loadingChatRequestState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.messages != null && state.messages!.isNotEmpty) {
          return ListView.builder(
            reverse: true,
            itemCount: state.messages!.length,
            itemBuilder: (context, index) {
              final List<Message> messages =state.messages!.reversed.toList();
              final Message message = messages[index];
              final bool isMe = message.senderId == sl<AuthBloc>().state.appUser!.id;
              return MessageBubble(message: message, isMe: isMe);
            },
          );
        } else {
          return const Center(child: Text('No messages yet.'));
        }
      },
    );
  }
}
