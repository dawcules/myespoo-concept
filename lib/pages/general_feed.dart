import 'package:flutter/material.dart';
//import 'package:cityprog/widgets/lists/clickable_listview.dart';
//import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_general.dart';

class GeneralFeed extends StatefulWidget {
  //final String _category;

  //GeneralFeed(this._category);

  @override
  _GeneralFeedState createState() => _GeneralFeedState();
}

class _GeneralFeedState extends State<GeneralFeed> {
  //String dropdownValue = 'Valitse kategoria';

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: key,
        body: Center(
          child: Container(
            height: 1000,
            width: 750,
            child: StreamBuilderGeneral()
            ),
        ),
      ),
    );
  }
}
