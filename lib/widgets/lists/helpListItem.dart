import 'package:flutter/material.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class HelpListTile extends StatelessWidget {
  final dynamic index;

  HelpListTile(this.index);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                // TODO: Get a localized category

              Text(
                index['type'].toString(),
              ),
              Icon(Icons.event_seat),
            ],
          ),
          VerticalDivider(),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  index['title'].toString(),
                  style: TextStyle(color: AppColor.secondary.color()),
                ),
                Flexible(child: Text(index['description'].toString())),
                Text( LocalizedCommunityHelpStrings.postedToLocalized() +': ' +
                    index['date'].toDate().toString().split(' ')[0]),
              ],
            ),
          ),
          VerticalDivider(),
          Image.network(index['img'].toString()),
        ],
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
