import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_clean_architecture/src/presentation/provider/whatsapp_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/body_whatsapp_chat.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/input_chat_messenger.dart';

class WhatsappCleanPage extends StatefulWidget {
  @override
  _WhatsappCleanPageState createState() => _WhatsappCleanPageState();
}

class _WhatsappCleanPageState extends State<WhatsappCleanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD8F6F9).withOpacity(0.8),
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xFF225082).withOpacity(0.9),
          title: Text(
            context.watch<WhatsappProvider>().isMyMessage
                ? 'FER U.M'
                : 'DIANA A.H',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.read<WhatsappProvider>().changeUser();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.swipe),
              ),
            )
          ],
        ),
        body: Column(
          children: [BodyWhatsappChat(), InputChatMessenger()],
        ));
  }
}
