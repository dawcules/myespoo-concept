import 'package:flutter/material.dart';

import '../buttons/continue_button_localized.dart';

// A list of all possible commands in form of a dialog.

class CommandsDialog extends StatelessWidget {
  final Map<String, String> _commands;
  const CommandsDialog(this._commands);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("nuoli oikeelle -> vaihtaa keywords?"),
              buildCommandsList(context),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      ),
    );
  }

  Widget buildCommandsList(BuildContext context) {
    print(_commands.length);
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      height: MediaQuery.of(context).size.height * 0.66,
      width: MediaQuery.of(context).size.width,
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
        Text(key, style: TextStyle(fontSize: 28)),
        Padding(padding: EdgeInsets.all(4)),
        Text(value, style: TextStyle(fontSize: 20),),
      ],
    );
  }
}
