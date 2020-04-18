import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';

// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderHelp extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final String myQuery;
  final String category;

  StreamBuilderHelp({this.myQuery, this.category});

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
    return Container(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                index['type'].toString(),
              ),
              Icon(Icons.event_seat),
            ],
          ),
          VerticalDivider(),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  index['title'].toString(),
                  style: TextStyle(color: AppColor.secondary.color()),
                ),
                Text(index['description'].toString()),
                Text('Ilmoitus jätetty: ' +
                    index['date'].toDate().toString().split(' ')[0]),
              ],
            ),
          ),
          VerticalDivider(),
          Image.network(index['img'].toString()),
        ],
      ),
    );
    /* onTap: () {
        Database().updateValue(
            'likes',
            1,
            index
                .reference); //Katso Database singleton, päivittää referenssin likeja
        //Tähän voi pistää vaikka navigoinnin ja viedä index dokkarin mukana.
      }, */
  }
}
