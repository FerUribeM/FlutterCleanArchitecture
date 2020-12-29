// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/interfaces/imanager_database_firebase.dart';
import '../data/interfaces/iwhatsapp_datasource.dart';
import '../data/interfaces/iwhatsapp_repository.dart';
import '../domain/interfaces/iwhatsapp_usecase.dart';
import '../data/repositories/manager_database_firebase.dart';
import '../data/datasources/whatsapp_datasource.dart';
import '../presentation/provider/whatsapp_provider.dart';
import '../data/repositories/whatsapp_repository_imp.dart';
import '../domain/usecases/whatsapp_usecase.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<IWhatsappDatasource>(
      () => WhatsappDatasource(get<IManagerDatabaseFirebase>()));
  gh.factory<IWhatsappRepository>(
      () => WhatsappRepositoryImp(get<IWhatsappDatasource>()));
  gh.lazySingleton<IWhatsappUsecase>(
      () => WhatsappUsecase(get<IWhatsappRepository>()));
  gh.factory<WhatsappProvider>(() => WhatsappProvider(get<IWhatsappUsecase>()));

  // Eager singletons must be registered in the right order
  gh.singleton<IManagerDatabaseFirebase>(ManagerDatabaseFirebase());
  return get;
}
