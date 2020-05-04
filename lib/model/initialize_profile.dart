import 'dart:io';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Class for fetching the user profile and subscribing him/her to the right services
class InitializeProfile{
    InitializeProfile();
    
    final FirebaseMessaging _fcm = FirebaseMessaging();
    final Firestore _db = Firestore.instance;
    final uid = Auth().getUser();
    var user;
    var data;
    //Getting user data from the database
    void getUserData(){
      user = Database().getUserDataReference(user: uid).then((DocumentSnapshot snapshot) {
      data = snapshot.data;
      initializeSubscriptions(data);
      });
    }
    
    _saveDeviceToken({user}) async {
    String uid = user.uid != null ? user.uid : 'Gmpyu42rUyEuust5tudj';
    String fcmToken = await _fcm.getToken();
    if (fcmToken != null) {
      var tokenRef = _db
          .collection('users')
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
    //Initializing the subscriptions. note that if the values change so will the subscriptions.
    void initializeSubscriptions(data){
      _saveDeviceToken(user: uid);

      if(user != null){
         _fcm.subscribeToTopic("Important");
        if(data["notifications"]){
          print("notifications on");
          print("subscribing to public events");
         _fcm.subscribeToTopic("PublicEvents");
         _fcm.subscribeToTopic("Location");
          
        if(data["beacon activated"]){
          print("beacon on");
          _fcm.subscribeToTopic("EmergencyBeacon");
        }
        if(data["security survailance"]){
          print("security on");
          _fcm.subscribeToTopic("Security");
        }
        if(data["community services"]){
          print("community on");
          _fcm.subscribeToTopic("Community");
        }
        if(data["help services"]){
          print("help on");
          _fcm.subscribeToTopic("Helper");
        }
        if(data["special health condition"]){
          print("healthcare on");
          _fcm.subscribeToTopic("Healthcare");
          _fcm.subscribeToTopic("Receiver");
        }
        if(data["events selected"]){
          print("events on");
          _fcm.subscribeToTopic("Tapahtumat");
        }
        if(data["UI"]){
           print("UI");
        }
        if(data["postal code"] != null){
          _fcm.subscribeToTopic("postalCode");
        }
      }
      }
}
}