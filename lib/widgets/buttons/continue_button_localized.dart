import 'package:flutter/material.dart';

import '../../strings/string_provider.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          StringProvider.continueToLocalized(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
