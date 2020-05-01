import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';
import 'package:cityprog/widgets/database_model/auth.dart';


// Example. Streambuildattu Listview firestore datalla. päivitetään eventin likeja painamalla.
class StreamBuilderHealth extends StatelessWidget {
  //Tähän siis sisään collection mikä näytetään

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Database().getHealth(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading..');

            var content = snapshot.data.documents;

            return GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(8),
              // Generate 100 widgets that display their index in the List.
              children: List.generate(content.length, (index) {
                List<String> cardDate =
                    content[index]['date'].toDate().toString().split(' ');
                List<String> dateFormat = cardDate[0].split('-');
                List<String> cardTime = cardDate[1].split(':');
                  return Material(
                    elevation: 5,
                    child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 8.0)),
                            Text(
                              content[index]['typeFI'],
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            Text(content[index]['locationFI'],
                                textAlign: TextAlign.center),
                            Text(
                                dateFormat[2] +
                                    '.' +
                                    dateFormat[1] +
                                    '.' +
                                    dateFormat[0] +
                                    ' ' +
                                    cardTime[0] +
                                    ':' +
                                    cardTime[1],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                                textAlign: TextAlign.center),
                            Text(content[index]['slot'].toString() + 'min',
                                textAlign: TextAlign.center),
                            Text(content[index]['address'],
                                textAlign: TextAlign.center),
                            FlatButton(
                              child: Text(
                                'Varaa',
                                style: TextStyle(
                                    color: AppColor.whiteText.color()),
                              ),
                              onPressed: () {
                                Database().reserveHealth(content[index].documentID, Auth().getUID());
                              },
                              color: AppColor.secondary.color(),
                            )
                          ],
                        ),
                      ),
                    );
              }),
            );

            //return ListViewBuilder(snapshot.data.documents);
          }),
    );
  }
}

//SWagety. Pistin samaan selkeyden
/* class ListViewBuilder extends StatelessWidget {
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
    return HealthListTile(index);
  }
} */
