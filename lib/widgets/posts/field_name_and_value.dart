import 'package:flutter/material.dart';

class FieldNameAndValue extends StatelessWidget {
  final String fieldName;
  final String value;
  final Widget valueChild;
  static const TextStyle _style = TextStyle(
    fontSize: 20,
  );
  const FieldNameAndValue({this.fieldName, this.value, this.valueChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(fieldName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Padding(padding: EdgeInsets.all(2),),
        valueChild != null ? valueChild : Text(value, style: _style),
      ],
    );
  }
}
