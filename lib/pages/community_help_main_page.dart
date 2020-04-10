import 'package:flutter/material.dart';
import '../widgets/rows/dropdown_select.dart';

class CommunityHelpMain extends StatefulWidget {
  @override
  _CommunityHelpMainState createState() => _CommunityHelpMainState();
}

class _CommunityHelpMainState extends State<CommunityHelpMain> {
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
                        'Apupalvelu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0)),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: Text(
                          'Pyydä apua kanssakaupunkilaisilta tai ilmoittaudu avuntarjoajaksi muille',
                          style: TextStyle(fontSize: 20)),
                    ),
                    DropdownSelect( <String>[
                  'Valitse kategoria',
                  'Kauppa-asiointi',
                  'Huonekalut',
                  'Pihatyöt',
                  'Muu tarve'
                ], key, '/communityHelpCat'),
                    FlatButton(
                      child: Text('Ilmoittaudu avuntarjojaksi'),
                      color: Colors.amber,
                      onPressed: (){
                        Navigator.of(context).pushNamed('/communityHelpSign');
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
