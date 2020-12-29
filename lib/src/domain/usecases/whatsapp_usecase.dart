import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_clean_architecture/src/data/models/user_whatsapp_model.dart';
import 'package:flutter_clean_architecture/src/domain/interfaces/iwhatsapp_usecase.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/iwhatsapp_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IWhatsappUsecase)
class WhatsappUsecase extends IWhatsappUsecase {

  final IWhatsappRepository _repository;

  WhatsappUsecase(this._repository);

  @override
  List<String> getAllChat() {
    return _repository.getAllChats();
  }

  @override
  void sendNewMessage(String message, bool isMyMessage) {
    return _repository.sendNewMessage(message, isMyMessage);
  }

  @override
  Future<List<UserWhatsappModel>> readChat() async {
    final result = List<UserWhatsappModel>();

    final data = await _repository.readChat();

    data.listen((event) {
      if(event != null && event.snapshot != null){

        final data = event.snapshot;

        if(data != null && data.value != null){
          Map<dynamic, dynamic> values = data.value;

          values.forEach((key, values) {
            result.add(UserWhatsappModel(values['date'], values['isMyMessage'] == true, values['message'], ''));
          });

          result.sort((a, b) {
            return b.date.compareTo(a.date);
          });

        }
      }
    });

    return result;
  }

  @override
  Stream<Event> readChatEvent() {
    return _repository.readChat();
  }

  @override
  Future<List<UserWhatsappModel>> mapFirebaseDataToModel(DataSnapshot snapshot) async {
    final result = List<UserWhatsappModel>();

    if(snapshot != null){

      final data = snapshot;

      if(data != null && data.value != null){
        Map<dynamic, dynamic> values = data.value;

        values.forEach((key, values) {
          result.add(UserWhatsappModel(values['date'], values['isMyMessage'] == true, values['message'], ''));
        });

        result.sort((a, b) {
          return b.date.compareTo(a.date);
        });

      }
    }
    return result;
  }

}


