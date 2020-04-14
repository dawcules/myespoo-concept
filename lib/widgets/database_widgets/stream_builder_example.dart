import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';



// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderExample extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final String myQuery;

  StreamBuilderExample({this.myQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
          stream: Database().getCollection(myQuery),
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
      child:ListView.builder(
        padding: EdgeInsets.all(16),
        itemExtent: 80,
        itemCount: queryData.length,
        itemBuilder: (BuildContext _context, index) {
          return _buildListItem(context, queryData[index]);
        }));
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