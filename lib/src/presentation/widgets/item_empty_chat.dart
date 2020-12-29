import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemEmptyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Lottie.asset('assets/empty_state.json'),
            Text(
              'Aun no tienes mensajes',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}