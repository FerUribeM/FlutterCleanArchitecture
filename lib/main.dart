import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/di/di.dart';
import 'package:flutter_config/flutter_config.dart';



import 'package:flutter_clean_architecture/src/presentation/provider/whatsapp_provider.dart';
import 'src/presentation/pages/whatsapp_clean_page.dart';

//TODO: Comando para crear las clases en tiempo de ejecución y poder correr la app
// flutter packages pub run build_runner build --delete-conflicting-outputs


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();

  await FlutterConfig.loadEnvVariables();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<WhatsappProvider>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture',
      debugShowCheckedModeBanner: false,
      initialRoute: 'whatsapp',
      routes: {
        'whatsapp': (context) => WhatsappCleanPage(),
      },
    );
  }
}