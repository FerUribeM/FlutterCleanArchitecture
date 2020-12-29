import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clean_architecture/src/data/models/user_whatsapp_model.dart';
import 'package:flutter_clean_architecture/src/domain/interfaces/iwhatsapp_usecase.dart';

@injectable
class WhatsappProvider extends ChangeNotifier {
  final IWhatsappUsecase _whatsappUsecase;

  WhatsappProvider(this._whatsappUsecase);

  bool _isMyMessage = false;

  bool get isMyMessage => this._isMyMessage;

  changeUser(){
    this._isMyMessage = !this.isMyMessage;
    notifyListeners();
  }

  set isMyMessage(bool value) {
    this._isMyMessage = value;
    notifyListeners();
  }

  List<String> getAllChats() {
    return _whatsappUsecase.getAllChat();
  }

  void sendNewMessage(String message) {
    _whatsappUsecase.sendNewMessage(message, _isMyMessage);
    notifyListeners();
  }

  Future<List<UserWhatsappModel>> readChat() async {
    return _whatsappUsecase.readChat();
  }

  Stream<Event> readChatEvent() {
    return _whatsappUsecase.readChatEvent();
  }

  Future<List<UserWhatsappModel>> mapFirebaseToModel(DataSnapshot snapshot) {
    return _whatsappUsecase.mapFirebaseDataToModel(snapshot);
  }


}
