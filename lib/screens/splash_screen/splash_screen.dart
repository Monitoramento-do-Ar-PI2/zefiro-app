import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 30),
            child: Image.asset(
              'assets/logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Image.asset('assets/zefiro.png')
        ],
      )),
    );
  }
}
