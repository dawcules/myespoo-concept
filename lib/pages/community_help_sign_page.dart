import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class CommunityHelpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: new Text('Smart Espoo   -   Apupalvelu'),
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
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text('Ilmoittaudu avuntarjoajaksi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text('Ilmoittautumalla avuntarjoajaksi autat muita selviämään arjen askareissa ja edistät yleistä hyvinvointia',
                      style: TextStyle(fontSize: 20)),
                    ),
                    FlatButton(
                      color: AppColor.primary.color(),
                      child: Text('Ilmoittaudu', 
                      style: TextStyle(color: AppColor.lightText.color())),
                      onPressed: () => {null},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}