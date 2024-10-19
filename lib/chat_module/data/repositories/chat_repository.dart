import 'package:chat_mindest/chat_module/domain/entities/message.dart';
import 'package:chat_mindest/chat_module/domain/repository/base_chat_repository.dart';
import 'package:chat_mindest/core/error/exceptions.dart';
import 'package:chat_mindest/core/utils/error_manager.dart';
import 'package:dartz/dartz.dart';

import '../datasource/chat_remote_data_source.dart';
import '../models/message_model.dart';

class ChatRepository implements BaseChatRepository {
  final BaseChatDataSource baseChatDataSource ;
  ChatRepository(this.baseChatDataSource);

  @override
  Future<Either<ErrorManager, bool>> sendMessage({required Message message}) async {
    try {
      final messageModel = MessageModel(
        id: message.id,
        senderId: message.senderId,
        receiverId: message.receiverId,
        text: message.text,
        timestamp: message.timestamp,
      );

      final result = await baseChatDataSource.sendMessage(
          message: messageModel);
      return Right(result);
    } on FirebaseException catch (error) {
      return Left(ErrorManager(error.errorMessage));
    }
  }

}
