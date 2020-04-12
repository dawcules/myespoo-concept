import 'package:flutter/material.dart';

import '../../strings/string_provider.dart';

class ContinueButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(StringProvider.continueToLocalized()),
    );
  }
}
