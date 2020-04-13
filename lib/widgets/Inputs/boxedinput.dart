import 'package:cityprog/styles/custom_decoration.dart';
import 'package:flutter/material.dart';


class Boxedinput extends StatelessWidget {

  final String hint;

  Boxedinput(this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: EdgeInsets.all(10),
                        decoration: CustomDecoration().formBoxDecoration(),
                        child: TextField(
                          decoration: CustomDecoration().loginInputDecoration(hint),
                        ),
                      );
  }
}