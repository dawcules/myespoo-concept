  
import 'dart:async';
import 'package:cityprog/platform/desktop.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';

class Auth {
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

  void setupForDesktop(){
     WidgetsFlutterBinding.ensureInitialized();
      setTargetPlatformForDesktop();
  }

  static _deleteUser() async {}
  static _saveUser(user) async {}

  void disposeAuth(){
    _auth.close();
    _userChanged?.cancel();
  }
  void initAuth(){
    _auth = AuthBloc(saveUser: _saveUser, deleteUser: _deleteUser, app: _app);
    _auth.add(CheckUser());
    final _fbAuth = FBAuth(_app);
    _userChanged = _fbAuth.onAuthChanged().listen((user) {
      _auth.add(UpdateUser(user));
    });
  }
  factory Auth() => _instance;
}