import 'package:cityprog/current_language.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class EventListTile extends StatelessWidget {
  final dynamic index;

  EventListTile(this.index);

  @override
  Widget build(BuildContext context) {
    String cardTitle;
    String cardDesc;
    String cardLocation;
    String label;
    List<String> cardDate = index['date'].toDate().toString().split(' ');
    List<String> cardTime = cardDate[1].split(':');
    //String cardDate = index['date'].toDate().toString().split(' ') as String;
    if (CurrentLanguage.value == Language.FI) {
      cardTitle = 'nameFI';
      cardDesc = 'descFI';
      cardLocation = 'locationFI';
      label = 'Tapahtuma';
    } else {
      cardTitle = 'nameEN';
      cardDesc = 'descEN';
      cardLocation = 'locationEN';
      label = 'Event';
    }

    return Container(
      width: 750,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        /* boxShadow: [
          BoxShadow(color: Color.fromRGBO(92, 219, 122, 0.7), spreadRadius: 3),
        ], */
      ),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Text(
              index[cardTitle],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              index[cardDesc],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                'https://i.picsum.photos/id/${index['img']}/650/350.jpg',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            Text(index[cardLocation] + ", " + index['area'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(cardDate[0] + ' ' + cardTime[0] + ':' + cardTime[1],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            Container(
              height: 25,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green[600]),
              child: Text(
                label,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
