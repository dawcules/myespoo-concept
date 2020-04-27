import 'package:flutter/material.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          height: 1000,
          width: 750,
          child: Center(
            child: Text("This is the greatest personal page in the world!")
          ),
        ),
      ),
    );
  }
}
