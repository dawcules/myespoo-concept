import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class BoxedFormConfirmPw extends StatelessWidget {

  final String hint;
  final String validationText;
  final TextEditingController passwordController;

  BoxedFormConfirmPw({this.hint, this.validationText, this.passwordController});


  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: EdgeInsets.all(10),
                        decoration: CustomDecoration().formBoxDecoration(),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) => value.isEmpty || (value.isNotEmpty && value != 
                          passwordController.text) ? "Must match the previous entry" : null,
                          style: TextStyle(color: AppColor.secondary.color(), fontFamily: 'RadikalLight'),
                          decoration: CustomDecoration().loginInputDecoration(hint),
                        ),
                      );
  }
}
