import 'package:chat_mindest/core/utils/error_manager.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../data/models/message_model.dart';
import '../entities/message.dart';
import '../../data/repositories/chat_repository.dart';
import '../repository/base_chat_repository.dart';

class SendMessageUseCase {
  final BaseChatRepository baseChatRepository;

  SendMessageUseCase(this.baseChatRepository);

  Future<Either<ErrorManager, bool>> execute({required Message message}) async {

    return await baseChatRepository.sendMessage(message: message);
  }




}
