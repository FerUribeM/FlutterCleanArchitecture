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
}
