import 'package:cityprog/strings/navigation_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class SpeechActiveDialog extends StatelessWidget {
  final String _descriptionFirst =
      NavigationStrings.speechDialogHelpString().split(" ").first + " ";
  final String _descriptionSecond =
      NavigationStrings.speechDialogHelpString().split(" ")[1] + " ";
  final List<String> _descriptionRest =
      NavigationStrings.speechDialogHelpString().split(" ");
  @override
  Widget build(BuildContext context) {
    _descriptionRest.removeAt(0);
    _descriptionRest.removeAt(0);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      elevation: 24,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 1.0),
            color: AppColor.background.color(),
          ),
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                    ),
                    text: _descriptionFirst,
                    children: [
                      TextSpan(
                        text: _descriptionSecond,
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: _descriptionRest.join(" "),
                        style: TextStyle(
                            color: AppColor.secondary.color(), fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
