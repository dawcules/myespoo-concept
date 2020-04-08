import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {

  final String text;
  final Color color;

  CenteredText({this.text ,this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Text(text,
                      style:
                          TextStyle(color: color),
                ),
                );
  }
}