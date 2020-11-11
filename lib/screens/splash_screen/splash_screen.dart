import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      opacity = 0;
    });
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: AnimatedOpacity(
        opacity: this.opacity,
        duration: const Duration(seconds: 1),
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
        ),
      )),
    );
  }
}
