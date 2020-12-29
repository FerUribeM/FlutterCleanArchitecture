import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/presentation/provider/whatsapp_provider.dart';
import 'package:provider/provider.dart';

class InputChatMessenger extends StatefulWidget {

  @override
  _InputChatMessengerState createState() => _InputChatMessengerState();
}

class _InputChatMessengerState extends State<InputChatMessenger> {
  final TextEditingController _controller = TextEditingController();

  bool showIcons = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2.0,
                                  offset: Offset(1, 2),
                                  spreadRadius: 1.0)
                            ],
                            borderRadius: BorderRadius.circular(40)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: TextField(
                            controller: _controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enviar mensaje..."),
                          ),
                        ),
                      ),
                      Positioned(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showIcons = !showIcons;
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              child: Text(
                                showIcons ? '\u{1F435}': '\u{1F648}',
                                style: TextStyle(fontSize: 20),
                              )),
                          right: 22,
                          top: 22)
                    ],
                  ),
                  flex: 6,
                ),
                Expanded(
                  child: FloatingActionButton(
                    onPressed: () {
                      print("tiene texto: ${_controller.text}");
                      if (_controller.text.isNotEmpty) {
                        context
                            .read<WhatsappProvider>()
                            .sendNewMessage(_controller.text);
                        _controller.clear();
                      }
                    },
                    child: Icon(Icons.send),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          showIcons ? EmojiPicker(
              rows: 3,
              columns: 7,
              numRecommended: 10,
              onEmojiSelected: (emoji, category) {
                _controller.text += emoji.emoji;
              }) : Container()
        ],
      ),
    );
  }
}
