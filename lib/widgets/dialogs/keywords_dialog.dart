import 'package:flutter/material.dart';

import '../../strings/string_provider.dart';
import '../buttons/continue_button_localized.dart';
import '../rows/key_value_text_row.dart';

class KeywordsDialog extends StatelessWidget {
  final Map<String, String> keywords;
  final Language _language;
  const KeywordsDialog(this.keywords, this._language);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: buildCommandsList(context),
      actions: <Widget>[
        ContinueButton(_language),
      ],
    );
  }

  Widget buildCommandsList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
          itemCount: keywords.length,
          itemBuilder: (BuildContext context, int position) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: getRow(position, context),
            );
          }),
    );
  }

  Widget getRow(int position, BuildContext context) {
    String key = keywords.keys.toList()[position];
    String value = keywords.values.toList()[position];
    return KeyValueTextRow(key, value);
  }
}
