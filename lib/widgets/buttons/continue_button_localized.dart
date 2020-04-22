import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.check_box, size: 50, color: AppColor.button.color(),)
      ),
    );
  }
}
