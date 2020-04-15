import 'package:cityprog/strings/navigation_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class SpeechDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1.0),
          color: AppColor.background.color(),
        ),
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.7,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                NavigationStrings.speechDialogHelpString(),
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
