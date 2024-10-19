import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_mindest/auth_module/domain/entities/user.dart';
import 'package:chat_mindest/chat_module/presentation/controller/chat_bloc.dart';
import 'package:chat_mindest/chat_module/presentation/controller/chat_events.dart';
import '../../../../auth_module/presentation/controller/auth_bloc.dart';
import '../../../../core/services/service_locator.dart';
import 'message_input.dart';
import 'messages_list.dart';

class ChatScreen extends StatelessWidget {
  final AppUser receiverUser;

  ChatScreen({super.key, required this.receiverUser});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>.value(
      value: sl<ChatBloc>()
        ..add(LoadChatEvent(
          receiverUser: receiverUser,
          senderUser: sl<AuthBloc>().state.appUser!,
        )),


      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: ListTile(
            title:Text(receiverUser.name),
            titleTextStyle:  const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            subtitle: Text(receiverUser.email!),
            subtitleTextStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10,
              color: Colors.white,
            ),

          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Expanded(child: MessagesList()),
            MessageInput(receiverUser: receiverUser),
          ],
        ),
      ),
    );
  }
}
