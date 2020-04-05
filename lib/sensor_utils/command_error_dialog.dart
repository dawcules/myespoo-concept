import 'package:flutter/material.dart';

class CommandErrorDialog extends StatelessWidget {
  final String command;
  const CommandErrorDialog(this.command);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("unknown command $command"),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Continue"),
        )
      ],
    );
  }
}
