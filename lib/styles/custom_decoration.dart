import 'package:flutter/material.dart';
import './color_palette.dart';


class CustomDecoration {

  CustomDecoration._internal();  
  static final CustomDecoration _instance = CustomDecoration._internal();

  // WIP form input
  InputDecoration formInputDecoration(String hint, Icon icon) {
    return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.primary.color())),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1))),
      hintStyle: TextStyle(color: AppColor.hint.color()),
      icon: icon != null ? icon : null,
      errorStyle: TextStyle(color: AppColor.primary.color()),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColor.secondary.color())),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color:  AppColor.secondary.color())));
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