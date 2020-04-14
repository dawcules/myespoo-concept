import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {

  final String text;
  final double fontsize;
  final Color color;


  BodyText({this.text, this.fontsize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(  text,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.normal,
                      fontSize: fontsize),
                );
  }
}