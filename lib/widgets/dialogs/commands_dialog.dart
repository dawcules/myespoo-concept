import 'package:flutter/material.dart';

import '../buttons/continue_button_localized.dart';
import '../../strings/string_provider.dart';
// A custom error dialog -- specifically for speech recognition errors.

class CommandsDialog extends StatelessWidget {
  final Map<String, String> _commands;
  final Language _language;
  const CommandsDialog(this._commands, this._language);

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
    print(_commands.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
          itemCount: _commands.length,
          itemBuilder: (BuildContext context, int position) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: getRow(position, context),
            );
          }),
    );
  }

  Widget getRow(int position, BuildContext context) {
    String key = _commands.keys.toList()[position];
    String value =
        _commands.values.toList()[position];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(key, style: TextStyle(fontSize: 20)),
        Text(value),
      ],
    );
  }
}
