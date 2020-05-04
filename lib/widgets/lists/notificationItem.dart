import 'package:cityprog/current_language.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/string_provider.dart' show Language;

class NotificationListTile extends StatelessWidget {
  final dynamic index;

  NotificationListTile(this.index);

  @override
  Widget build(BuildContext context) {
    String cardContent;

    List<String> cardDate1 = index['start'].toDate().toString().split(' ');
    List<String> cardTime1 = cardDate1[1].split(':');
    List<String> cardDate2 = index['end'].toDate().toString().split(' ');
    List<String> cardTime2 = cardDate2[1].split(':');
    if (CurrentLanguage.value == Language.FI) {
      cardContent = 'contentFI';
    } else {
      cardContent = 'contentEN';
    }

    return Container(
      width: 750,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 8.0,
        child: ListTile(
          leading: Icon(Icons.warning, color: Colors.yellow[800], size: 45),
          title: Text(index[cardContent]),
          subtitle: Text(cardDate1[0] +
              ' ' +
              cardTime1[0] +
              ':' +
              cardTime1[1] +
              " - " +
              cardDate2[0] +
              ' ' +
              cardTime2[0] +
              ':' +
              cardTime2[1]),
        ),
      ),
    );
  }
}
