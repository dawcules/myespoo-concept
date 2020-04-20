import 'package:flutter/material.dart';
//import 'package:cityprog/widgets/lists/clickable_listview.dart';
//import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_comhelp.dart';

class CommunityHelpCat extends StatefulWidget {
  final String _category;

  CommunityHelpCat(this._category);

  @override
  _CommunityHelpCatState createState() => _CommunityHelpCatState();
}

class _CommunityHelpCatState extends State<CommunityHelpCat> {
  //String dropdownValue = 'Valitse kategoria';

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: key,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 700,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        widget._category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Expanded(
                      child: StreamBuilderHelp(myQuery: widget._category,),
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
