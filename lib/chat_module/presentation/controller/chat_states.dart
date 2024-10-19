
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/message.dart';

class ChatStates extends Equatable{
  final List<Message>? messages ;
  final RequestState loadingChatRequestState ;
  final String? loadingChatErrorMessage ;
  final List<Message>? sendingMessages;
  final List<Message>? failedMessages;
  final RequestState sendMessageRequestState;
  final String? sendMessageErrorMessage ;


  const ChatStates( {
     this.messages,
this.loadingChatRequestState = RequestState.loaded,
     this.loadingChatErrorMessage,
    this.sendingMessages,
    this.failedMessages,
     this.sendMessageRequestState = RequestState.loaded,
    this.sendMessageErrorMessage,
  });

  ChatStates copyWith({
    List<Message>? messages,
    RequestState? loadingChatRequestState,
    String? loadingChatErrorMessage,
    List<Message>? sendingMessages,
    List<Message>? failedMessages,
    RequestState? sendMessageRequestState,
    String? sendMessageErrorMessage
}){
     return ChatStates(
         messages: messages??this.messages,
         loadingChatRequestState: loadingChatRequestState??this.loadingChatRequestState,
         loadingChatErrorMessage: loadingChatErrorMessage??this.loadingChatErrorMessage,
         sendingMessages: sendingMessages??this.sendingMessages,
         failedMessages: failedMessages??this.failedMessages,
         sendMessageRequestState: sendMessageRequestState??this.sendMessageRequestState,
         sendMessageErrorMessage: sendMessageErrorMessage??this.sendMessageErrorMessage
     );
   }


  @override
  // TODO: implement props
  List<Object?> get props => [messages,loadingChatRequestState];
}