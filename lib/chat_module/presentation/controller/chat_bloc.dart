import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat_mindest/auth_module/presentation/controller/auth_bloc.dart';
import 'package:chat_mindest/chat_module/data/datasource/chat_remote_data_source.dart';
import 'package:flutter/material.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message_useCase.dart';
import 'chat_events.dart';
import 'chat_states.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates> {
  final SendMessageUseCase sendMessageUseCase;
  StreamSubscription<List<Message>>? _chatSubscription;

  ChatBloc(this.sendMessageUseCase) : super(const ChatStates()) {
    on<SendMessageEvent>(_sendMessage);
    on<LoadChatEvent>(_loadChat);
  }

  @override
  Future<FutureOr<void>> _sendMessage(SendMessageEvent event, Emitter<ChatStates> emit) async {
    emit(state.copyWith(sendMessageRequestState: RequestState.loading));

    final result = await sendMessageUseCase.execute(message: event.message);

    result.fold((l) {
      showDialog(
          context: event.context,
          builder: (BuildContext context) {
            return AlertDialog(content: Text(l.message));
          }
      );
      emit(state.copyWith(sendMessageRequestState: RequestState.error, sendMessageErrorMessage: l.message));
    }, (r) {
      emit(state.copyWith(sendMessageRequestState: RequestState.loaded));
    });
  }

  Future<void> _loadChat(LoadChatEvent event, Emitter<ChatStates> emit) async {
    sl<ChatBloc>().emit(state.copyWith(loadingChatRequestState: RequestState.loading));


    _chatSubscription = ChatRemoteDataSource().getMessages(event.senderUser.id, event.receiverUser.id).listen((List<Message> messages) {
      sl<ChatBloc>().emit(state.copyWith(messages: messages, loadingChatRequestState: RequestState.loaded));
    });
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
