import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class HealthListTile extends StatelessWidget {
  final String type;

  HealthListTile(this.type);

  //Random times and dates
  // Reserve -> Toast and hide the card
  // No actual functionality


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[50],
      height: 130,
      child: Material(
        elevation: 5.0,
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'TEXT HERE',
                    style: TextStyle(color: AppColor.secondary.color(), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Flexible(child: Text('TEXT HERE', style: TextStyle(fontSize: 16))),
                  Text( LocalizedCommunityHelpStrings.postedToLocalized()),
                ],
              ),
            ),
            //Image.network(index['img'].toString()),
          ],
        ),
      ),
    );
  }
}

/* onTap: () {
        Database().updateValue(
            'likes',
            1,
            index
                .reference); //Katso Database singleton, päivittää referenssin likeja
        //Tähän voi pistää vaikka navigoinnin ja viedä index dokkarin mukana.
      }, */
