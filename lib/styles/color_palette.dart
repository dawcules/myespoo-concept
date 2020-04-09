import 'package:flutter/material.dart';

enum AppColor { primary ,secondary ,background ,hint , lightText , darkText , whiteText }

extension GetAppColor on AppColor {
  Color color(){
    switch (this) {
      case AppColor.primary:
        return Color.fromRGBO(21, 22, 255, 1);
      case AppColor.secondary:
        return Color.fromRGBO(14, 80, 186, 1);
      case AppColor.background:
        return Colors.white;
      case AppColor.hint:
        return Colors.grey;
      case AppColor.whiteText:
        return Colors.white;
      case AppColor.darkText:
        return Color.fromRGBO(21, 22, 255, 1);
      case AppColor.lightText:
        return Color.fromRGBO(21, 22, 255, 1);
      default:
        return Colors.white;
    }
  }
}

