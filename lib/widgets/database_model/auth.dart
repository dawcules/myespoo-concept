  
import 'dart:async';
import 'package:fb_auth/fb_auth.dart';

class Auth {

  //singleton instance, Firebase web instance 
  Auth._internal();  
  static final Auth _instance = Auth._internal();
  final _app = FbApp(
    apiKey: " AIzaSyCrYqY8optvP8lHc3D-iK24YNYo6mkgkZI",
    authDomain: "localhost",
    databaseURL: "https://cityprog-24974.firebaseio.com/",
    projectId: "cityprog-24974",
    storageBucket: "gs://cityprog-24974.appspot.com/");
  
  AuthBloc _auth;
  StreamSubscription<AuthUser> _userChanged;
  AuthUser _user;

  static _deleteUser() async {}
  static _saveUser(user) async {}

  void disposeAuth(){
    _auth.close();
    _userChanged?.cancel();
  }
  //setter and getter for the authuser.
  void setUser({AuthUser user}){
    _user = user;
  }
  AuthUser getUser(){
    return _user;
  }

  //User for initializing the authbloc plugin. adding observer pattern to current user
  void initAuth(){
    _auth = AuthBloc(saveUser: _saveUser, deleteUser: _deleteUser, app: _app);
    final _fbAuth = FBAuth(_app);
    _userChanged = _fbAuth.onAuthChanged().listen((user) {
      _user = user;
      _auth.add(UpdateUser(user));
    });
  }

  //Login
  void login({email,password}){
      print("Logging in");
        _auth.add(LoginEvent(email, password));
  }

  //Account creation
  void createAccount({email, password, name}){
    print("Creating account");
    _auth.add(CreateAccount(email, password, displayName: name));
  }

  //UID. 
  String getUID(){
    print(_user.toString());
    return _user.uid;
  }

  //This is used in the main widget to setup the authbloc for the app.
  AuthBloc getAuthBloc(){
    return _auth;
  }

  //factory instance
  factory Auth() => _instance;
}