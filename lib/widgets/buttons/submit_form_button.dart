import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/validation_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SubmitFormButton extends StatelessWidget {
  final Function onPress;
  final Function onValidatedSuccess;
  const SubmitFormButton({this.onPress, this.onValidatedSuccess});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: UniversalRaisedButton(
              color: AppColor.button.color(),
              title: LocalizedCommunityStrings.postToLocalized(),
              textColor: AppColor.buttonText.color(),
              fontSize: 24,
              padding: 8,
              // Logic inside this widget, so we don't need
              // to write the line for the toast in every widget.
              onPressed: () => onPress((validationSucceeded) => {
                    if (validationSucceeded)
                      {onValidatedSuccess()}
                    else
                      _showErrorToast(context)
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _showErrorToast(BuildContext context) {
    Toast.show(ValidationStrings.fillAllFieldsToLocalized(), context,
        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  }
}
