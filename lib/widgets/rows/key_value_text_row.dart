import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KeyValueTextRow extends StatelessWidget {
  final String _key;
  final String _value;
  KeyValueTextRow(this._key, this._value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: AutoSizeText(
            _key,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxFontSize: 30,
            maxLines: 3,
            minFontSize: 20,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
        ),
        Flexible(
          flex: 1,
          child: AutoSizeText(
            _value,
            maxLines: 3,
            maxFontSize: 20,
            minFontSize: 20,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
