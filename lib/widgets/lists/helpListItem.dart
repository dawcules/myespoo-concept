import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class HelpListTile extends StatelessWidget {
  final dynamic index;

  HelpListTile(this.index);


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
                    index['title'].toString(),
                    style: TextStyle(color: AppColor.secondary.color(), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Flexible(child: Text(index['description'].toString(), style: TextStyle(fontSize: 16))),
                  Text( LocalizedCommunityHelpStrings.postedToLocalized() +': ' +
                      index['date'].toDate().toString().split(' ')[0]),
                ],
              ),
            ),
            Image.asset('assets/images/helper.jpg', width: 160),
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
