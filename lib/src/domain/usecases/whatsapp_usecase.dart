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

}


