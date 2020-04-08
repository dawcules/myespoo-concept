import 'package:flutter/material.dart';


class ColorPalette{

  ColorPalette._internal();  
  static final ColorPalette _instance = ColorPalette._internal();


  Color getColor(String s, {String color}){
    switch (color) {
      case "primary":
        return Color.fromRGBO(21, 22, 255, 1);
        break;
      case "secondary":
        return Color.fromRGBO(14, 80, 186, 1);
        break;
      case "background":
        return Colors.white;
        break;
      case "hint":
        return Colors.grey;
        break;
      case "lightText":
        return Colors.white;
        break;
      case "darkText":
        return Color.fromRGBO(21, 22, 255, 1);
        break;
      default:
        return Colors.white;
    }
  }

  factory ColorPalette() => _instance;
  
}