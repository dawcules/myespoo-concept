import 'package:cityprog/database.dart';
import 'package:flutter/material.dart';



// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderExample extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään
  final String myQuery;

  StreamBuilderExample({this.myQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
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
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemExtent: 80,
        itemCount: queryData.length,
        itemBuilder: (BuildContext _context, index) {
          return _buildListItem(context, queryData[index]);
        });
  }

  Widget _buildListItem(BuildContext context, index) {
    return ListTile(
      title: Row(children: [
        Expanded(
            child: Text(
              index['nimi'].toString(),
            )),
        Container(
            decoration: const BoxDecoration(color: Colors.pink),
            padding: EdgeInsets.all(10),
            child: Text(index['likes'].toString(),),),
        Divider(),
      ]),
      trailing: Icon(Icons.person_pin),
      onTap: () {
          Database().updateValue('likes', 1, index.reference); //Katso Database singleton, päivittää referenssin likeja
          //Tähän voi pistää vaikka navigoinnin ja viedä index objektin mukana.
      },
    );
  }
}