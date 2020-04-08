import 'package:flutter/material.dart';

class ShadowedBoxContainer extends StatelessWidget {
  final List<Widget> children;
  const ShadowedBoxContainer({this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(21, 22, 255, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      children[0],
                      children[1],
                    ],
                  ),
                );
  }
}