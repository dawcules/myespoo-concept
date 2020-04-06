import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MessageHandler extends StatefulWidget {
  @override
  createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  var iosSubscription;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    //Waiting for iOS app to get a permission, otherwise saving the token asap.
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data){
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(
        IosNotificationSettings(),
      );
    } else {
      _saveDeviceToken();
    }
    // THIS CONFIGURES THE MESSAGE HANDLER TO USE ONE KIND OF NOTIFICATION WHEN ACTION OCCURS. 
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {

        //THIS IS CODE FOR SNACKBAR
        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () => null,
          ),
        );
        Scaffold.of(context).showSnackBar(snackbar);
        //THIS IS FOR ALERT
        /*
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: ListTile(
                title: Text(message['notification']['title']),
                subtitle: Text(message['notification']['body']),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
        );
        */
        _showNotificationWithoutSound(
            message['notification']['id'],
            message['notification']['title'],
            message['notification']['text'],
            message['notification']['sound']);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
    );
  }

  //This shows soundless notification. Can be customized in alot of ways
  Future _showNotificationWithoutSound(_id, _post, _description,
      _payload) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        playSound: false, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      _id,
      _post,
      _description,
      platformChannelSpecifics,
      payload: _payload,
    );
  }

  _saveDeviceToken() async {
    String uid = 'Gmpyu42rUyEuust5tudj';
    String fcmToken = await _fcm.getToken();
    if (fcmToken != null) {
      var tokenRef = _db
          .collection('Citizen')
          .document(uid)
          .collection('tokens')
          .document(fcmToken);
      await tokenRef.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),
        'platform': Platform.operatingSystem,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Basically you have to return something so this returns an empty container object
    return Container(width: 0,height: 0,);
  }
}