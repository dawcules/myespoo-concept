import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final String text;

  LoginButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(14, 80, 186, 1),
                  ),
                  child: Center(
                    child: Text(text, style: TextStyle(color: Colors.white),)
                  ),
                );
  }
}