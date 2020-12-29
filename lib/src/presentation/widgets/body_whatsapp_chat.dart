import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_clean_architecture/src/data/models/user_whatsapp_model.dart';
import 'package:flutter_clean_architecture/src/presentation/provider/whatsapp_provider.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/item_empty_chat.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/item_progress_chat.dart';
import 'package:flutter_clean_architecture/src/presentation/widgets/my_chat_message.dart';

class BodyWhatsappChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(child: StreamBuilder<Event>(
      stream: context.select((WhatsappProvider model) => model.readChatEvent()),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot != null &&
            asyncSnapshot.hasData &&
            !asyncSnapshot.hasError &&
            asyncSnapshot.data.snapshot.value != null) {
          final items = context.select((WhatsappProvider model) =>
              model.mapFirebaseToModel(asyncSnapshot.data.snapshot));
          return FutureBuilder<List<UserWhatsappModel>>(
              future: items,
              builder: (context,
                  AsyncSnapshot<List<UserWhatsappModel>> snapshot) {
                if (snapshot != null &&
                    snapshot.data != null &&
                    snapshot.data.isNotEmpty) {
                  return new ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyChatMessage(
                            snapshot.data[index].isMyMessage,
                            snapshot.data[index].message);
                      });
                }
                return ItemProgressChat();
              });
        } else {
          return ItemEmptyChat();
        }
      },
    )));
  }
}