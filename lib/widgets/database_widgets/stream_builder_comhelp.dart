import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';
import 'package:cityprog/widgets/lists/helpListItem.dart';

// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderHelp extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final String myQuery;


  StreamBuilderHelp({this.myQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Database().getHelpByCategory(myQuery),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');
            return ListViewBuilder(snapshot.data.documents);
          }),
    );
  }
}

//SWagety. Pistin samaan selkeyden
class ListViewBuilder extends StatelessWidget {
  final queryData;

  ListViewBuilder(this.queryData);

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: queryData.length,
            itemBuilder: (BuildContext _context, index) {
              return Column(
                children: <Widget>[
                  _buildListItem(context, queryData[index]),
                  Divider(),
                ],
              );
              
            }));
  }

  Widget _buildListItem(BuildContext context, index) {
    return HelpListTile(index);
  }
}
