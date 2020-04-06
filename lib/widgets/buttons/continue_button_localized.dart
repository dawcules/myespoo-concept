import 'package:flutter/material.dart';

import '../../strings/string_provider.dart';

class ContinueButton extends StatelessWidget {
  final Language _language;
  const ContinueButton(this._language);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text(StringProvider.continueToLocalized(_language)),
    );
  }
}
