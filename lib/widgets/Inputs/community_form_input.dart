import 'package:flutter/material.dart';

class CommunityFormInput extends StatelessWidget {
  final String hint;
  final int maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color borderColor;

  CommunityFormInput(
      {this.hint,
      this.maxLines,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey[300],
      ))),
      child: TextField(
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          fontSize: fontSize ?? 20,
        ),
        maxLines: maxLines ?? null,
        minLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint ?? "no hint text...",
          hintStyle: TextStyle(
            color: color ?? Colors.grey,
            fontSize: 16,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
