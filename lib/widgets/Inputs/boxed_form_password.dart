import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class BoxedFormPassword extends StatelessWidget {

  final String hint;
  final String validationText;
  final Function validation;
  final bool autovalidate;
  final TextEditingController passwordController;

  BoxedFormPassword({this.hint, this.validationText, this.passwordController, this.validation, this.autovalidate});

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: EdgeInsets.all(10),
                        decoration: CustomDecoration().formBoxDecoration(),
                        child: TextFormField(
                            obscureText: true,
                            autovalidate: autovalidate ? autovalidate : false,
                            controller:  passwordController,
                            validator: (value) => validation(value) ? validationText : null,
                            style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                            decoration: CustomDecoration().loginInputDecoration(hint),
                        ),
                      );
  }
}