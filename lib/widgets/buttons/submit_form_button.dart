import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class SubmitFormButton extends StatelessWidget {
  final Function onPress;
  const SubmitFormButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: AppColor.button.color(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocalizedCommunityStrings.postToLocalized(),
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.buttonText.color(),
                  ),
                ),
              ),
              onPressed: () => onPress(),
            ),
          )
        ],
      ),
    );
  }
}
