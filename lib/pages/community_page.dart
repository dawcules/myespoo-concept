import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            RaisedButton(
            child: Text("Carpool demo"),
            onPressed: () => {Navigator.of(context).pushNamed("/carpool")},
          ),
          RaisedButton(
            child: Text("Marketplace demo"),
            onPressed: () => {Navigator.of(context).pushNamed("/market")},
          ),
          ],)
        ),
      ),
    );
  }
}
