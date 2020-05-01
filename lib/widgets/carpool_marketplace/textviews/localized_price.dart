import 'package:cityprog/strings/community_strings.dart';
import 'package:flutter/material.dart';

class LocalizedPrice extends StatelessWidget {
  final double price;
  final double fontSize;
  const LocalizedPrice(this.price, {this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        LocalizedCommunityStrings.localizePriceFromValue(price, justValue: true).toString(),
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
