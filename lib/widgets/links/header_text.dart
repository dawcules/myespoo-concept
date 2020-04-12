import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {

  final String text;
  final double fontsize;
  final Color color;


  HeaderText({this.text, this.fontsize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(  text,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: fontsize),
                );
  }
}