import 'package:flutter/material.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class HelpListTile extends StatelessWidget {
  final dynamic index;

  HelpListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.white70, Color.fromRGBO(242, 63, 87, 0.8)]),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(242, 63, 87, 0.7), spreadRadius: 3),
        ],
      ),
      height: 150,
      width: 750,
      child: Material(
        shadowColor: Colors.transparent,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        elevation: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      index['title'].toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Flexible(
                        child: Text(index['description'].toString(),
                            style: TextStyle(fontSize: 18))),
                    Text(LocalizedCommunityHelpStrings.postedToLocalized() +
                        ': ' +
                        index['date'].toDate().toString().split(' ')[0]),
                  ],
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/helper.jpg',
                  width: 170,
                  height: 150,
                  fit: BoxFit.fitHeight,
                )),
          ],
        ),
      ),
    );
  }
}
