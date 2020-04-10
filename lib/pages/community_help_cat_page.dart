import 'package:flutter/material.dart';

class CommunityHelpCat extends StatefulWidget {
  final String _category;

  CommunityHelpCat(this._category);

  @override
  _CommunityHelpCatState createState() => _CommunityHelpCatState();
}

class _CommunityHelpCatState extends State<CommunityHelpCat> {
  String dropdownValue = 'Valitse kategoria';

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: key,
        appBar: AppBar(
          title: new Text('Smart Espoo   -   Apupalvelut'),
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
                        widget._category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                          'LIST HERE',
                          style: TextStyle(fontSize: 20)),
                    ),
                  
                    FlatButton(
                      child: Text('TODO'),
                      color: Colors.amber,
                      onPressed: (){print('TODO');},
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
