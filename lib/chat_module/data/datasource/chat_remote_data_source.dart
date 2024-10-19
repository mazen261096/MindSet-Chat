
import 'package:chat_mindest/core/error/exceptions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chat_mindest/core/error/exceptions.dart';

import '../models/message_model.dart';
abstract class BaseChatDataSource{
  Future<bool> sendMessage({required MessageModel message});

}


class ChatRemoteDataSource implements BaseChatDataSource {
  final DatabaseReference database = FirebaseDatabase.instance.ref();

  // إرسال رسالة إلى Firebase
  @override
  Future<bool> sendMessage({required MessageModel message}) async {
    try {
      // تحديد المسار بناءً على الـ id المرسل والمستقبل
      String chatId = _generateChatId(message.senderId, message.receiverId);
      String messageId = _generateMessageId(message.senderId, message.timestamp);

      // إرسال الرسالة إلى المسار المحدد
      await database.child('chats/$chatId/messages/$messageId').set(message.toMap());

      return true;
    } catch (error) {
      throw FirebaseException(errorMessage: error.toString());
    }
  }

  // الحصول على جميع الرسائل من الشات
  Stream<List<MessageModel>> getMessages(String senderId, String receiverId) {
    String chatId = _generateChatId(senderId, receiverId);

    // إنشاء stream للاستماع إلى التحديثات
    return database.child('chats/$chatId/messages').onValue.map((event) {
      if (event.snapshot.value != null) {
        Map<String, dynamic> messagesMap = Map<String, dynamic>.from(event.snapshot.value as Map);
        return messagesMap.values.map((message) {
          return MessageModel.fromMap(Map<String, dynamic>.from(message));
        }).toList();
      } else {
        return [];
      }
    });
  }



  // توليد معرف الشات من المرسل والمستقبل
  String _generateChatId(String senderId, String receiverId) {
    return senderId.compareTo(receiverId) < 0 ? '$senderId-$receiverId' : '$receiverId-$senderId';
  }

  // توليد معرف الرسالة باستخدام معرف المرسل وتوقيت الإرسال
  String _generateMessageId(String senderId, DateTime timestamp) {
    return '${timestamp.millisecondsSinceEpoch}';
  }
}
