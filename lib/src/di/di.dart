import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => $initGetIt(getIt);