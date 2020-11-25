import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/domain/interfaces/iwhatsapp_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class WhatsappProvider extends ChangeNotifier {

  final IWhatsappUsecase _whatsappUsecase;

  WhatsappProvider(this._whatsappUsecase);

  List<String> getAllChats() {
    return _whatsappUsecase.getAllChat();
  }
}
