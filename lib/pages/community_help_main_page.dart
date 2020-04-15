import 'package:cityprog/pages/community_help_sign_page.dart';
import 'package:cityprog/widgets/routes/zoom_route.dart';
import 'package:flutter/material.dart';
import '../widgets/rows/dropdown_select.dart';
import 'package:cityprog/strings/community_help_strings.dart';

class CommunityHelpMain extends StatefulWidget {
  @override
  _CommunityHelpMainState createState() => _CommunityHelpMainState();
}

class _CommunityHelpMainState extends State<CommunityHelpMain> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: key,
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
                      child: Text(
                        LocalizedCommunityHelpStrings.mainTitleToLocalized(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                          LocalizedCommunityHelpStrings.descToLocalized(),
                          style: TextStyle(fontSize: 20)),
                    ),
                    DropdownSelect(LocalizedCommunityHelpStrings.listToLocalized(), key, '/communityHelpCat'),
                    FlatButton(
                      child: Text(LocalizedCommunityHelpStrings.volunteerBtnToLocalized()),
                      color: Colors.amber,
                      onPressed: (){
                        //Navigator.of(context).pushNamed('/communityHelpSign');
                        Navigator.push(context, ZoomRoute(page: CommunityHelpPage()));
                      },
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