import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/widgets/rows/trade_method_row.dart';
import 'package:flutter/material.dart';

import './community_form.dart';

class CommunityPostForm extends StatelessWidget {
  final Trading _tradeMethod;
  CommunityPostForm(this._tradeMethod);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Card(
          child: Column(
            children: <Widget>[
              TradeMethodRow(
                _tradeMethod,
                fontSize: 28,
                mainAxisAlign: MainAxisAlignment.center,
              ),
              CommunityForm(_tradeMethod),
            ],
          ),
        ),
      ),
    );
  }
}
