import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemProgressChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        child: Lottie.asset(
            'assets/animation_progress_chat.json'));
  }
}