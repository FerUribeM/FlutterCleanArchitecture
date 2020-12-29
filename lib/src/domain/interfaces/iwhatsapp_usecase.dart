import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_clean_architecture/src/data/models/user_whatsapp_model.dart';

abstract class IWhatsappUsecase {
  List<String> getAllChat();

  void sendNewMessage(String message, bool isMyMessage);

  Future<List<UserWhatsappModel>> readChat();

  Stream<Event> readChatEvent();

  Future<List<UserWhatsappModel>> mapFirebaseDataToModel(DataSnapshot snapshot);

}