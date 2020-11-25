import 'package:flutter_clean_architecture/src/core/util/data_dummy.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/iwhatsapp_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IWhatsappDatasource)
class WhatsappDatasource extends IWhatsappDatasource {

  @override
  List<String> getAllChats() {
    return getAllChatsDummy();
  }

}