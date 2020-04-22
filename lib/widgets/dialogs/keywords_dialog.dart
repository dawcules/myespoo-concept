import 'package:cityprog/strings/localized_descriptions.dart';
import 'package:flutter/material.dart';

import '../buttons/continue_button_localized.dart';
import '../rows/key_value_text_row.dart';

class KeywordsDialog extends StatelessWidget {
  final Map<String, String> keywords;
  const KeywordsDialog(this.keywords);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                // Header row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(LocalizedDescriptions.routeToLocalized(),
                        style: TextStyle(fontSize: 32)),
                    Text(LocalizedDescriptions.exampleToLocalized(),
                        style: TextStyle(fontSize: 32)),
                  ],
                ),
              ),
              // List of routes and their examples
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: buildCommandsList(context),
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCommandsList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      height: MediaQuery.of(context).size.height * 0.66,
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: ListView.builder(
            itemCount: keywords.length,
            itemBuilder: (BuildContext context, int position) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: getRow(position, context),
              );
            }),
      ),
    );
  }

  Widget getRow(int position, BuildContext context) {
    String key = keywords.keys.toList()[position];
    String value = keywords.values.toList()[position];
    return KeyValueTextRow(key, value);
  }
}
