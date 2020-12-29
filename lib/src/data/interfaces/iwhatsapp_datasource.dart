import 'package:firebase_database/firebase_database.dart';

abstract class IWhatsappDatasource {

  List<String> getAllChats();

  Stream<Event> readChat();

  void sendNewMessage(String message, bool isMyMessage);

}