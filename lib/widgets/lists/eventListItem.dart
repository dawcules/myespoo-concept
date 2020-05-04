import 'package:cityprog/current_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:connectivity/connectivity.dart';

var connectOK = false;

class EventListTile extends StatefulWidget {
  final dynamic index;

  EventListTile(this.index);

  @override
  _EventListTileState createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
  @override
  void initState() {
    connectOK = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String cardTitle;
    String cardDesc;
    String cardLocation;
    String label;
    List<String> cardDate = widget.index['date'].toDate().toString().split(' ');
    List<String> cardTime = cardDate[1].split(':');
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
    getConnectivityResult() async {
      if (kIsWeb) {
        connectOK = true;
      } else {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          connectOK = true;
        }
      }
    }

    getConnectivityResult();
    return Container(
      width: 750,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Text(
              widget.index[cardTitle],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.index[cardDesc],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            if (connectOK)
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://i.picsum.photos/id/${widget.index['img']}/650/350.jpg',
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
              ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            Text(widget.index[cardLocation] + ", " + widget.index['area'],
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
