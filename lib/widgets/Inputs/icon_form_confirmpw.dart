import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class IconFormConfirm extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final Icon icon;
  final TextEditingController passwordController;
  final TextEditingController controller;

  IconFormConfirm({this.hint, this.validationText, this.icon, this.validation, this.passwordController, this.controller});

  @override
  Widget build(BuildContext context) {
    return 
                      TextFormField(
                            obscureText: true,
                            autovalidate: false,
                            controller: controller,
                            validator: (value) => validation(value, passwordController.text) ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().formInputDecoration(hint, icon),
                      );
  }
}