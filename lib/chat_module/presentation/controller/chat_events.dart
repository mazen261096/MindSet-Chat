import 'package:chat_mindest/auth_module/domain/entities/user.dart';
import 'package:chat_mindest/chat_module/domain/entities/message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ChatEvents extends Equatable{
  const ChatEvents();

  @override
  List<Object> get props =>[];
}


class SendMessageEvent extends ChatEvents {
final Message message ;

final BuildContext context;
const SendMessageEvent({
  required this.message,
  required this.context,
});
}

class LoadChatEvent extends ChatEvents {
final AppUser receiverUser;
final AppUser senderUser;

  const LoadChatEvent({
   required this.receiverUser,
   required this.senderUser,
  });
}
