import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class IconMultiInput extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final Icon icon;
  final TextEditingController controller;

  IconMultiInput({this.hint, this.validationText, this.icon, this.controller, this.validation});

  @override
  Widget build(BuildContext context) {
    return 
                      TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            controller: controller,
                            validator: (value) => validation(value) ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().formInputDecoration(hint, icon),
                      );
  }
}