import 'package:flutter/material.dart';

import 'src/di/di.dart';

import 'src/presentation/pages/whatsapp_clean_page.dart';

//TODO: Comando para crear las clases en tiempo de ejecución y poder correr la app
// flutter packages pub run build_runner build

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();

  runApp(MyApp());
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