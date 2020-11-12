import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _saveDeviceToken();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final snackbar = SnackBar(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['title']),
            ),
            action: SnackBarAction(
              label: 'Go',
              onPressed: () => Navigator.of(context).pop(),
            )
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        final snackbar = SnackBar(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['title']),
            ),
            action: SnackBarAction(
              label: 'Go',
              onPressed: () => Navigator.of(context).pop(),
            )
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        final snackbar = SnackBar(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['title']),
            ),
            action: SnackBarAction(
              label: 'Go',
              onPressed: () => Navigator.of(context).pop(),
            )
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// Get the token, save it to the database for current user
  _saveDeviceToken() async {
    // Get the current user
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = _db
          .collection('tokens')
          .doc(fcmToken);

      await tokens.set({
        'token': fcmToken,
      });
    }
  }

}