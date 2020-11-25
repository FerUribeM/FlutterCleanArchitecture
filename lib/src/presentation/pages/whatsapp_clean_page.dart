import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/di/di.dart';
import 'package:flutter_clean_architecture/src/presentation/provider/whatsapp_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/item_whatsapp_chat.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class WhatsappCleanPage extends StatefulWidget {
  @override
  _WhatsappCleanPageState createState() => _WhatsappCleanPageState();
}

class _WhatsappCleanPageState extends State<WhatsappCleanPage> {
  Color whatsappColor = Color(0xFF115F55);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => getIt<WhatsappProvider>(),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: whatsappColor,
            title: Text('Whatsapp Clone'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {},
            child: Icon(Icons.message),
          ),
          body: FutureBuilder<List<String>>(
            initialData: GetIt.I.get<WhatsappProvider>().getAllChats(),
            builder: (_, elements) {
              return ListView.builder(
                itemCount: elements.data.length,
                itemBuilder: (context, asyncSnathot) {
                  return ItemWhatsappChat(name: elements.data[asyncSnathot],);
                },
              );
            },
          )
      ),
    );
  }
}
