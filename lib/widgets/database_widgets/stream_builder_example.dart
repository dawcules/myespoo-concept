import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';
import 'package:getflutter/getflutter.dart';

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
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemExtent: 80,
            itemCount: queryData.length,
            itemBuilder: (BuildContext _context, index) {
              return _buildListItem(context, queryData[index]);
            }));
  }

  Widget _buildListItem(BuildContext context, index) {
    return GFCard(
      boxFit: BoxFit.cover,
      image: Image.network(
          'https://i.picsum.photos/id/${index['img']}/500/300.jpg'),
      title: GFListTile(
          title: Text('Card Title'),
          icon: GFIconButton(
            onPressed: null,
            icon: Icon(Icons.favorite_border),
            type: GFButtonType.transparent,
          )),
      content: Text("Some quick example text to build on the card"),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.start,
        children: <Widget>[
          GFButton(
            onPressed: () {},
            text: 'Read More',
          ),
        ],
      ),
    );
  }
}
