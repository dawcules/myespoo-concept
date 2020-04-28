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
    return 
        Scaffold(
        key: key,
        body: Center(child: Container(
          height: 1000,
          width: 750,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                    DropdownSelect(
                        LocalizedCommunityHelpStrings.listToLocalized(),
                        key,
                        '/communityHelpCat'),
                    Padding(padding: EdgeInsets.all(20.0)),
                    /* RaisedButton(
                      color: AppColor.button.color(),
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/communityHelpSign');
                        Navigator.push(
                            context, ZoomRoute(page: CommunityHelpRequest()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        child: Text(
                          LocalizedCommunityHelpStrings.askHelpToLocalized(),
                          style: TextStyle(
                            color: AppColor.buttonText.color(),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ), */
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    /* RaisedButton(
                      color: AppColor.button.color(),
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/communityHelpSign');
                        Navigator.push(
                            context, ZoomRoute(page: CommunityHelpPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 16,
                        ),
                        child: Text(
                          LocalizedCommunityHelpStrings
                              .volunteerBtnToLocalized(),
                          style: TextStyle(
                            color: AppColor.buttonText.color(),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ), */
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
