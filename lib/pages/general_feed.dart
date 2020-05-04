import 'package:flutter/material.dart';
import 'package:cityprog/widgets/database_widgets/stream_builder_general.dart';

// Base widget for general feed (home page / home feed). Calls a StreamBuilder widget, which starts and build from all data sources.

class GeneralFeed extends StatefulWidget {

  @override
  _GeneralFeedState createState() => _GeneralFeedState();
}

class _GeneralFeedState extends State<GeneralFeed> {
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
