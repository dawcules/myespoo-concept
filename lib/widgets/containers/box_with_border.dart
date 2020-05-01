import 'package:flutter/material.dart';

class BoxWithBorder extends StatelessWidget {
  final List<Widget> children;
  final double borderRadius;
  final double borderWidth;
  final double padding;
  final double margin;
  final double width;

  const BoxWithBorder({
    this.children,
    this.borderRadius = 10,
    this.borderWidth = 1,
    this.padding = 8,
    this.margin = 0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: Container(
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      ),
    );
  }
}
