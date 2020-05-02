import 'package:flutter/material.dart';
//import 'package:cityprog/strings/community_help_strings.dart';
import 'package:cityprog/widgets/lists/premiseListItem.dart';

class CommunityPremises extends StatefulWidget {
  @override
  _CommunityPremisesState createState() => _CommunityPremisesState();
}

class _CommunityPremisesState extends State<CommunityPremises> {
  //String dropdownValue = 'Valitse kategoria';

  // TODO: Localize


  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Center(
        child: Container(
          height: 1000,
          width: 750,
          child: Scaffold(
            key: key,
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10.0)),
                    Container(
                      child: Text(
                        'PREMISES TEXT HERE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Expanded(
                      child: CurrentPremiseCard(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
