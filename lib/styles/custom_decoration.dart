import 'package:flutter/material.dart';
//import './color_palette.dart';


class CustomDecoration {

  CustomDecoration._internal();  
  static final CustomDecoration _instance = CustomDecoration._internal();

  // WIP form input
  InputDecoration formInputDecoration(String hint, String iconPath) {
    return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1))),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1))),
      hintStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
      icon: iconPath != '' ? Image.asset(iconPath) : null,
      errorStyle: TextStyle(color: Color.fromRGBO(248, 218, 87, 1)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(248, 218, 87, 1))),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  Color.fromRGBO(248, 218, 87, 1))));
  }
  // Current login input
  InputDecoration loginInputDecoration(String hint){
    return InputDecoration(
                              border: InputBorder.none,
                              hintText: hint,
                              hintStyle: TextStyle(color: Colors.grey));
  }
  BoxDecoration formBoxDecoration(){
    return BoxDecoration(
                          border: Border(
                          bottom: BorderSide(
                          color: Colors.grey[300],),),);
  }
  factory CustomDecoration() => _instance;
}