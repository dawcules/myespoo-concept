import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class InitializeProfile{
    InitializeProfile();
    final FirebaseMessaging _fcm = FirebaseMessaging();
    final uid = Auth().getUser();
    var user;
    var data;

    void getUserData(){
      user = Database().getUserDataReference(user: uid).then((DocumentSnapshot snapshot) {
      data = snapshot.data;
      initializeSubscriptions(data);
      });
    }

    void initializeSubscriptions(data){
      if(user != null){
        if(data["notifications"]){
          print("notifications on");
          print("subscribing to public events");
         _fcm.subscribeToTopic("PublicEvents");
         _fcm.subscribeToTopic("Important");
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