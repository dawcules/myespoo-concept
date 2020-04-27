import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class InitializeProfile{
  InitializeProfile();
  //final FirebaseMessaging _fcm = FirebaseMessaging();
    final uid = Auth().getUID();
    var user;
    var data;

    void getUserData(){
      user = Database().getUserDataReference(user: uid).then((DocumentSnapshot snapshot) {
      data = snapshot.data;
      initializeSubscriptions();
      });
    }

    void initializeSubscriptions(){
      if(user != null){
        if(user.data["beaconIsSelected"]){
          
        }
        if(user.data[""]){
          
        }
      }
    }
  
    

}