import 'package:flutter/material.dart';

import '../buttons/continue_button_localized.dart';

// A custom error dialog -- specifically for speech recognition errors.

class CommandsDialog extends StatelessWidget {
  final Map<String, String> _commands;
  const CommandsDialog(this._commands);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildCommandsList(context),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Row(
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
          )
        ],
      ),
    );
  }

  Widget buildCommandsList(BuildContext context) {
    print(_commands.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.66,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Scrollbar(
        child: ListView.builder(
            itemCount: _commands.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: getRow(position, context),
              );
            }),
      ),
    );
  }

  Widget getRow(int position, BuildContext context) {
    String key = _commands.keys.toList()[position];
    String value = _commands.values.toList()[position];
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
