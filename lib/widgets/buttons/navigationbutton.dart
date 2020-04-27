import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {

  final String text;
  final Icon icon;
  final Function function;
  final int index;

  NavigationButton({this.text, this.icon, this.function, this.index});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 50.0,
      height: 100.0,
      child: FlatButton(
                        onPressed: () => function(index),
                        child: Column(children: <Widget>[
                            icon,
                            Text(text, style: TextStyle(color: AppColor.secondary.color(), fontSize: 15, wordSpacing: 1)),  
                        ],)    
                            ),
                            );
  }
}