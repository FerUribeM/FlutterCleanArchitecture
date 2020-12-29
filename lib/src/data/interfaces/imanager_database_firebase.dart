import 'package:firebase_database/firebase_database.dart';

abstract class IManagerDatabaseFirebase{

  void _initFirebase();

  void sendChat(String message, bool isMyMessage);

  Stream<Event> readMessage();

}