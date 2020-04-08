import 'package:flutter/material.dart';


class Boxedinput extends StatelessWidget {

  final String hint;

  Boxedinput(this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.grey[300],
                        ))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hint,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      );
  }
}