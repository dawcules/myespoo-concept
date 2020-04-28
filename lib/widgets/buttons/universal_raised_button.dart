import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class UniversalRaisedButton extends StatelessWidget {
  final Function onPressed;
  final double padding;
  final double margin;
  final double fontSize;
  final double borderRadius;
  final String title;
  final Color textColor;
  final Color color;
  const UniversalRaisedButton({
    this.onPressed,
    this.title,
    this.padding,
    this.margin,
    this.color,
    this.textColor,
    this.fontSize,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin ?? 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Text(
            title ?? "No title",
            style: TextStyle(
                color: textColor ?? AppColor.buttonText.color(),
                fontSize: fontSize ?? 20),
          ),
        ),
        color: color ?? AppColor.button.color(),
        onPressed: onPressed != null ? () => onPressed() : null,
      ),
    );
  }
}
