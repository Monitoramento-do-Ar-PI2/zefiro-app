import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zéfiro',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(),
    );
  }
}
