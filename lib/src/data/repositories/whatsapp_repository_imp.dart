import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/iwhatsapp_datasource.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/iwhatsapp_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWhatsappRepository)
class WhatsappRepositoryImp extends IWhatsappRepository {

  final IWhatsappDatasource _datasource;

  WhatsappRepositoryImp(this._datasource);

  @override
  List<String> getAllChats() {
    return _datasource.getAllChats();
  }

  @override
  void sendNewMessage(String message, bool isMyMessage) {
    return _datasource.sendNewMessage(message, isMyMessage);
  }

  @override
  Stream<Event> readChat() {
    return _datasource.readChat();
  }



}
