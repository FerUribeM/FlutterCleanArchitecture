import 'package:firebase_database/firebase_database.dart';

abstract class IWhatsappRepository {

  List<String> getAllChats();

  void sendNewMessage(String message, bool isMyMessage);

  Stream<Event> readChat();

}