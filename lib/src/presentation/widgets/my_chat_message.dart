import 'package:flutter/material.dart';

class MyChatMessage extends StatelessWidget {

  bool isMyMessage;
  String message;

  MyChatMessage(this.isMyMessage, this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            child: Text(message, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
            decoration: BoxDecoration(color: isMyMessage ? Colors.blueGrey.withOpacity(0.4) : Colors.green.withOpacity(0.4),
                borderRadius: customBorder(isMyMessage)
            ),
            padding: EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }

  BorderRadius customBorder(bool isMyMessage){
    if(isMyMessage){
      return BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
      );
    }else {
      return BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
      );
    }
  }

}