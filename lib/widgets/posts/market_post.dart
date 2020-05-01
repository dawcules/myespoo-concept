import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityprog/model/market.dart';
import 'package:cityprog/widgets/rows/trade_method_row.dart';
import 'package:flutter/material.dart';

import '../../styles/color_palette.dart';

class MarketPostWidget extends StatefulWidget {
  final MarketPostData postData;
  final Function _moreButtonPressed;
  const MarketPostWidget(this.postData, this._moreButtonPressed);

  @override
  _MarketPostWidgetState createState() => _MarketPostWidgetState();
}

class _MarketPostWidgetState extends State<MarketPostWidget> {
  @override
  void initState() {
    super.initState();
    //print("init");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: InkWell(
          splashColor: AppColor.secondary.color(),
          onTap: () => widget._moreButtonPressed(),
          child: Card(
            elevation: 2,
            child: Wrap(
              children: <Widget>[
                TradeMethodRow(
                  widget.postData.tradeMethod,
                  fontSize: 16,
                  paddingAmount: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _autoSizeTextRow(
                              widget.postData.title, context,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                      ),
                      widget.postData.imageUri != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                                imageUrl: widget.postData.imageUri,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(0),
                            ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _autoSizeTextRow(String text, BuildContext context,
      {TextStyle style}) {
    return Container(
      child: Wrap(
        children: <Widget>[
          AutoSizeText(
            text,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: style == null
                ? TextStyle(
                    fontSize: 24,
                  )
                : style,
          ),
        ],
      ),
    );
  }
}
