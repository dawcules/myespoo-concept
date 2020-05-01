import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/database_model/auth.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:flutter/material.dart';

class CitizenPointUpdateDialog extends StatelessWidget {
  final int amount;
  final Widget title;

  const CitizenPointUpdateDialog({this.amount = 100, this.title});

  // Update current user's citizenpoints
  void updateCitizenPoints() {
    Database()
        .updateCitizenpoints(user: Auth().getUID(), citizenpoints: amount);
  }

  @override
  Widget build(BuildContext context) {
    updateCitizenPoints();
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      contentPadding: EdgeInsets.all(8),
      title: title ??
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$amount ",
                style: TextStyle(
                  color: AppColor.secondary.color(),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                children: [
                  TextSpan(
                      text:
                          "${LocalizedWidgetStrings.citizenPointsAwardedToLocalized()}! 🏆",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.normal))
                ]),
          ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("${LocalizedWidgetStrings.niceToLocalized()}!"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
