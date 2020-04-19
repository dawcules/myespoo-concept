import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';

class StreamBuilderGeneral extends StatelessWidget {

 /*  final String myQuery;
  final String category;
  StreamBuilderGeneral({this.myQuery, this.category}); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Database().getCollection('Apupalvelu'),
          builder: (context, snapshot1) {
            return StreamBuilder(
              stream: Database().getCollection('Tapahtumat'),
              builder: (context, snapshot2) {
                if (!snapshot1.hasData && !snapshot2.hasData) return const Text('Loading..');
                return ListViewBuilder(snapshot1.data.documents, snapshot1.data.documents.length, snapshot2.data.documents, snapshot2.data.documents.length);
              },
              );
          }),
    );
  }
}

//SWagety. Pistin samaan selkeyden
class ListViewBuilder extends StatelessWidget {
  final helpData;
  final helpDataLength;
  final eventData;
  final eventDataLength;
  ListViewBuilder(this.helpData, this.helpDataLength, this.eventData, this.eventDataLength);

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: eventDataLength + helpDataLength,
            itemBuilder: (BuildContext _context, index) {
              return Column(
                children: <Widget>[
                  if (index <= helpDataLength-1)
                  _buildHelpItem(context, helpData[index]),
                  Divider(),
                  if (index <= eventDataLength-1)
                  _buildListItem(context, eventData[index]),
                  Divider(),
                ],
              );
              
            }));
  }

  Widget _buildHelpItem(BuildContext context, index) {
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
    Widget _buildListItem(BuildContext context, index) {
    return ListTile(
      title: Ink(
        color: AppColor.background.color(),
        child: Row(
        children: [
        Expanded(
            child: Text(
              index['nimi'].toString(), style: TextStyle(color: AppColor.secondary.color()),
            )),
        Container(
            decoration: BoxDecoration(color: AppColor.primary.color()),
            padding: EdgeInsets.all(10),
            child: Text(index['likes'].toString(),style: TextStyle(color: AppColor.whiteText.color()),),),
        Divider(),
      ]),),
      trailing: Icon(Icons.person_pin),
      onTap: () {
          Database().updateValue('likes', 1, index.reference); //Katso Database singleton, päivittää referenssin likeja
          //Tähän voi pistää vaikka navigoinnin ja viedä index dokkarin mukana.
      },
    );
  }
}
