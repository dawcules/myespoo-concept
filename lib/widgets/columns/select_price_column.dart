import 'package:cityprog/model/trade_methods.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectPriceColumn extends StatefulWidget {
  final Function onPriceChanged;
  final Function onTradeMethodChanged;
  final Trading tradeMethod;

  SelectPriceColumn(
      {this.onPriceChanged, this.tradeMethod, this.onTradeMethodChanged});

  @override
  _SelectPriceColumnState createState() => _SelectPriceColumnState();
}

class _SelectPriceColumnState extends State<SelectPriceColumn> {
  List<bool> _isSelected;
  List<Trading> _tradeMethods;
  bool _isFreeSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = [true, false];
    _isFreeSelected = false;
    if (widget.tradeMethod != null) {
      _tradeMethods = [widget.tradeMethod, Trading.FREE];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _toggleButtons(),
          _isFreeSelected
              ? Padding(
                  padding: EdgeInsets.all(0),
                )
              : Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        maxLength: 4,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => {
                          if (widget.onPriceChanged != null)
                            if (value == "")
                              {widget.onPriceChanged(null)}
                            else
                              widget.onPriceChanged(double.parse(value)),
                        },
                        decoration: InputDecoration(
                            focusColor: AppColor.button.color(),
                            hintText: LocalizedWidgetStrings.priceToLocalized(),
                            icon: Icon(Icons.euro_symbol)),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _toggleButtons() {
    return ToggleButtons(
      color: AppColor.button.color(),
      focusColor: AppColor.button.color(),
      onPressed: (int index) => {
        setState(
          () => {
            for (int i = 0; i < _isSelected.length; i++)
              {_isSelected[i] = i == index},
            if (widget.onTradeMethodChanged != null && _tradeMethods != null)
              {widget.onTradeMethodChanged(_tradeMethods[index])},
            setState(() => {
                  _isFreeSelected = index == 1,
                  if (index == 1 && widget.onPriceChanged != null) widget.onPriceChanged(null)
                })
          },
        )
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(LocalizedWidgetStrings.priceToLocalized(),
                style: TextStyle(fontSize: 20)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(LocalizedWidgetStrings.freeToLocalized(),
                style: TextStyle(fontSize: 20)),
          ),
        )
      ],
      isSelected: _isSelected,
    );
  }
}
