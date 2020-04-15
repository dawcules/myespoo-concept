import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/community_help_strings.dart';


class CommunityHelpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: new Text(LocalizedCommunityHelpStrings.titleToLocalized()),
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
                      child: Text(LocalizedCommunityHelpStrings.volunteerBtnToLocalized(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(LocalizedCommunityHelpStrings.signDescLocalized(),
                      style: TextStyle(fontSize: 20)),
                    ),
                    FlatButton(
                      color: AppColor.primary.color(),
                      child: Text(LocalizedCommunityHelpStrings.signUpToLocalized(), 
                      style: TextStyle(color: AppColor.whiteText.color())),
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