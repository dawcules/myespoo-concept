
import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class TradeMethodRow extends StatelessWidget {
  final Trading _method;
  const TradeMethodRow(this._method);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondary.color(),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _method.toLocalizedString(),
              style: TextStyle(
                color: AppColor.whiteText.color(),
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
