

import 'package:chat_mindest/chat_module/domain/entities/message.dart';
import 'package:dartz/dartz.dart';
import '../../../core/utils/error_manager.dart';
import '../../data/models/message_model.dart';


abstract class BaseChatRepository {
  Future<Either<ErrorManager,bool>> sendMessage({required Message message});

}