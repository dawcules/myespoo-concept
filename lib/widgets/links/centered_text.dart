import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {

  final String text;
  final Color color;
  final Function navigateToPage;
  CenteredText({this.text ,this.color, this.navigateToPage});
  @override
  Widget build(BuildContext context) {
    return Center(child:
                  FlatButton(onPressed: () => navigateToPage(),
                    child: Text(text,
                      style:
                          TextStyle(color: color),
                ),
                ), 
                );
  }
}