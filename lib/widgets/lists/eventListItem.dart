import 'package:cityprog/current_language.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class EventListTile extends StatelessWidget {
  final dynamic index;

  EventListTile(this.index);

  @override
  Widget build(BuildContext context) {
    String cardTitle;
    String cardDesc;
    String cardLocation;
    List<String> cardDate = index['date'].toDate().toString().split(' ');
    List<String> cardTime = cardDate[1].split(':');
    //String cardDate = index['date'].toDate().toString().split(' ') as String;
    if (CurrentLanguage.value == Language.FI) {
      cardTitle = 'nameFI';
      cardDesc = 'descFI';
      cardLocation = 'locationFI';
    } else {
      cardTitle = 'nameEN';
      cardDesc = 'descEN';
      cardLocation = 'locationEN';
    }

    return GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      margin: EdgeInsets.all(0.0),
      color: Colors.green[50],
      elevation: 5.0,
      image: Image.network(
          'https://i.picsum.photos/id/${index['img']}/500/300.jpg'),
      title: GFListTile(
        title: Text(index[cardTitle], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        subTitle: Text(index[cardDesc], style: TextStyle(fontSize: 16)),
      ),
      content: Column(
        children: <Widget>[
          Text(index[cardLocation] + ", " + index['area'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(cardDate[0] + ' ' + cardTime[0]+':'+cardTime[1], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13))
        ],
      ),
    );
  }
}
