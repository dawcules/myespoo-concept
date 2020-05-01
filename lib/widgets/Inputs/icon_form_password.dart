import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class IconFormPassword extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final Icon icon;
  final TextEditingController passwordController;
  final bool autovalidate;

  IconFormPassword({this.hint, this.validationText, this.icon, this.validation, this.passwordController, this.autovalidate});

  @override
  Widget build(BuildContext context) {
    return 
                      TextFormField(
                            obscureText: true,
                            autovalidate: autovalidate ? autovalidate: false,
                            controller: passwordController, 
                            validator: (value) => validation(value) ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().formInputDecoration(hint, icon),
                      );
  }
}