import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class BoxedFormInput extends StatelessWidget {

  final String hint;
  final String validationText;

  BoxedFormInput({this.hint, this.validationText});

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: EdgeInsets.all(10),
                        decoration: CustomDecoration().formBoxDecoration(),
                        child: TextFormField(
                            validator: (value) => value.isEmpty ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().loginInputDecoration(hint),
                        ),
                      );
  }
}