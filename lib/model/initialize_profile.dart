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
          /*
          for(var service in data["services"]["community"]){
                print("$service");
                //TODO PURKKAA LOCAL ACTIVITIES
                service != "Local Activities" ? _fcm.subscribeToTopic("$service") : _fcm.subscribeToTopic("LocalActivities");
                for(var area in data["services"]["community areas"]){
                    print("$area");
                   service != "Local Activities" ? _fcm.subscribeToTopic("$service$area") : _fcm.subscribeToTopic("LocalActivities$area");
                }
            }
            */
        }
        if(data["help services"]){
          print("help on");
          _fcm.subscribeToTopic("Helper");
          /*
          for(var service in data["services"]["help"]){
                print("$service");
                _fcm.subscribeToTopic("$service");
                for(var area in data["services"]["help areas"]){
                    print("$area");
                    _fcm.subscribeToTopic("$service$area");
                }
            }*/
        }
        if(data["special health condition"]){
          print("healthcare on");
          _fcm.subscribeToTopic("Healthcare");
          _fcm.subscribeToTopic("Receiver");/*
           for(var service in data["services"]["healthcare"]){
                print("$service");
                //TODO PURKKAA HEALTHCARE SUBSCRIPTIONS
                if(service == "Mental Disability"){
                  _fcm.subscribeToTopic("MentalDisability");
                }else if(service == "Physical Disability"){  _fcm.subscribeToTopic("PhysicalDisability");}
                else if(service == "Vision impaired"){_fcm.subscribeToTopic("VisionImpaired");}
                else{_fcm.subscribeToTopic("$service");}
            }*/
        }
        if(data["events selected"]){
          print("events on");
          _fcm.subscribeToTopic("Tapahtumat");
          /*
           for(var service in data["services"]["events"]){
                print("$service");
                _fcm.subscribeToTopic("$service");
                for(var area in data["services"]["event areas"]){
                    print("$area");
                    _fcm.subscribeToTopic("$service$area");
                }
            }
            */
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