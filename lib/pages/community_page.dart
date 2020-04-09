import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
            child: RaisedButton(
          child: Text("Carpool demo"),
          onPressed: () => {Navigator.of(context).pushNamed("/carpool")},
        )),
      ),
    );
  }
}
