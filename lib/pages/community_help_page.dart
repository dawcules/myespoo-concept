import 'package:flutter/material.dart';

class CommunityHelpPage extends StatelessWidget {
  const CommunityHelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: new Text('Smart Espoo      Apupalvelu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 600,
                width: 400,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Ilmoittaudu avuntarjoajaksi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                  FlatButton(
                    child: Text('Nappi'),
                    onPressed: () {
                      print('Blip');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
