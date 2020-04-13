import 'package:cityprog/strings/community_strings.dart';
import 'package:flutter/material.dart';

class LocalizedPrice extends StatelessWidget {
  final double price;
  const LocalizedPrice(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        LocalizedCommunityStrings.localizePriceFromValue(price, justValue: true).toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
