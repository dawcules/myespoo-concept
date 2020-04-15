import 'package:flutter/material.dart';

import '../buttons/continue_button_localized.dart';
import '../rows/key_value_text_row.dart';

class KeywordsDialog extends StatelessWidget {
  final Map<String, String> keywords;
  const KeywordsDialog(this.keywords);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildCommandsList(context),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Image.asset("assets/images/smartespoo.png"),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ContinueButton(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget buildCommandsList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
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
