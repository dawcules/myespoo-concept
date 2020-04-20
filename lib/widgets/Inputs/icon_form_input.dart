import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class IconFormInput extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final Icon icon;
  final TextEditingController controller;
  
  IconFormInput({this.hint, this.validationText, this.icon, this.validation, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                          autovalidate: true,
                          controller: controller,
                          validator: (value) => validation(value) ? validationText : null,
                          style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                          decoration: CustomDecoration().formInputDecoration(hint, icon),
                      );
  }
}