import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_config/flutter_config.dart';


import 'package:flutter_clean_architecture/src/core/util/util_extencions.dart';
import 'package:flutter_clean_architecture/src/data/interfaces/imanager_database_firebase.dart';

@Singleton(as: IManagerDatabaseFirebase)
class ManagerDatabaseFirebase extends IManagerDatabaseFirebase {
  FirebaseDatabase _database;

  final String chatID = "channelChatId-001";

  final String databaseURL = FlutterConfig.get('DATABASEURL_ANDROID');

  ManagerDatabaseFirebase() {
    _initFirebase();
  }

  @override
  void _initFirebase() async {
    final FirebaseApp app = await Firebase.initializeApp(
      options: Platform.isIOS || Platform.isMacOS
          ? FirebaseOptions(
              appId: FlutterConfig.get('APPID_IOS'),
              apiKey: FlutterConfig.get('APIKEY_IOS'),
              projectId: FlutterConfig.get('PROJECTID_IOS'),
              messagingSenderId: FlutterConfig.get('MESSAGINGSENDERID_IOS'),
              databaseURL: FlutterConfig.get('DATABASEURL_IOS'),
            )
          : FirebaseOptions(
              appId: FlutterConfig.get('APPID_ANDROID'),
              apiKey: FlutterConfig.get('APIKEY_ANDROID'),
              messagingSenderId: FlutterConfig.get('MESSAGINGSENDERID_ANDROID'),
              projectId: FlutterConfig.get('PROJECTID_ANDROID'),
              databaseURL: FlutterConfig.get('DATABASEURL_ANDROID'),
            ),
    );
    _database = FirebaseDatabase(app: app);
  }

  @override
  Stream<Event> readMessage() {

    final databaseReference = FirebaseDatabase(databaseURL: databaseURL)
        .reference()
        .child('chat_messsages')
        .child(chatID);

    return databaseReference.onValue;
  }

  @override
  Future<void> sendChat(String message, bool isMyMessage) async {
    try {
      _database
          .reference()
          .child('chat_messsages')
          .child(chatID)
          .child(getCurrentTime())
          .set({
        'message': message,
        'isMyMessage': isMyMessage,
        'date': getCurrentDate()
      });
    } catch (error) {
      print("Cae en el catch ${error.toString()}");
      return null;
    }
  }
}
