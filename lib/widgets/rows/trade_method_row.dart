import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class TradeMethodRow extends StatelessWidget {
  final Trading _method;
  final double fontSize;
  final double paddingAmount;
  final MainAxisAlignment mainAxisAlign;
  const TradeMethodRow(this._method, {this.fontSize, this.mainAxisAlign, this.paddingAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.secondary.color(),
      child: Row(
        mainAxisAlignment: mainAxisAlign ?? MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(paddingAmount ?? 16.0),
            child: Text(
              _method != null ? _method.toLocalizedString() : "Trade method is null......",
              style: TextStyle(
                color: AppColor.whiteText.color(),
                fontSize: fontSize ?? 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
