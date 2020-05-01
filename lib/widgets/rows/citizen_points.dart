import 'package:cityprog/strings/widget_texts.dart';
import 'package:flutter/material.dart';

class CitizenPointRow extends StatelessWidget {
  final int points;
  final Color textColor;
  const CitizenPointRow({this.points, this.textColor = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Icon(
        //   Icons.whatshot,
        //   color: Colors.amber,
        //   size: 16,
        // ),
        Text(
          "${LocalizedWidgetStrings.citizenPointsToLocalized()}: ${points ?? 0}",
          style: TextStyle(fontSize: 16, color: textColor),
        ),
        Text("🏆", style: TextStyle(fontSize: 12),),
      ],
    );
  }
}
