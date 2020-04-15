import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class IconFormConfirm extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final Icon icon;
  final TextEditingController passwordController;

  IconFormConfirm({this.hint, this.validationText, this.icon, this.validation, this.passwordController});

  @override
  Widget build(BuildContext context) {
    return 
                      TextFormField(
                            obscureText: true,
                            autovalidate: true,
                            validator: (value) => validation(value, passwordController.text) ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().formInputDecoration(hint, icon),
                      );
  }
}