import 'package:flutter_clean_architecture/src/data/interfaces/imanager_database_firebase.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/iwhatsapp_datasource.dart';
import 'package:flutter_clean_architecture/src/core/util/data_dummy.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWhatsappDatasource)
class WhatsappDatasource extends IWhatsappDatasource {

  final IManagerDatabaseFirebase _firebase;

  WhatsappDatasource(this._firebase);

  @override
  List<String> getAllChats() {
    return getAllChatsDummy();
  }

  @override
  void sendNewMessage(String message, bool isMyMessage) {
    _firebase.sendChat(message, isMyMessage);
  }

  @override
  Stream<Event> readChat() {
    return _firebase.readMessage();
  }

}