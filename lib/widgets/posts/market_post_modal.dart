import 'package:cityprog/model/market.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/widgets/carpool_marketplace/textviews/localized_price.dart';
import 'package:cityprog/widgets/columns/user_info_column.dart';
import 'package:cityprog/widgets/containers/box_with_border.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/dialogs/citizenpoint_update.dart';
import 'package:cityprog/widgets/posts/field_name_and_value.dart';
import 'package:flutter/material.dart';

class MarketPostModal extends StatefulWidget {
  final MarketPostData post;
  static const TextStyle _style = TextStyle(
    fontSize: 20,
  );
  const MarketPostModal(this.post);

  @override
  _MarketPostModalState createState() => _MarketPostModalState();
}

class _MarketPostModalState extends State<MarketPostModal> {
  int _citizenPoints;

  @override
  void initState() {
    super.initState();
    Database().getUserCitizenpoints(user: widget.post.uid);
  }

  void getCitizenPointsAsync() async {
    Database().getUserCitizenpoints(user: widget.post.uid).then((value) => {
          if (mounted)
            setState(() {
              _citizenPoints = value.data["citizenpoints"];
            })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Align(alignment: Alignment.centerLeft, child: _date()),
        Padding(
          padding: EdgeInsets.all(8),
        ),
        _body(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _price(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _user(),
        Padding(padding: EdgeInsets.only(top: 8)),
        _contact(),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }

  Widget _body() {
    return widget.post.body != null && widget.post.body.isNotEmpty
        ? BoxWithBorder(
            borderRadius: 5,
            children: [Text(widget.post.body, style: MarketPostModal._style)])
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }

  Widget _price() {
    return widget.post.price != null
        ? FieldNameAndValue(
            fieldName: LocalizedWidgetStrings.priceToLocalized(),
            valueChild: LocalizedPrice(widget.post.price),
          )
        : Padding(
            padding: EdgeInsets.all(0),
          );
  }

  Widget _user() {
    String name =
        widget.post.postedBy != null ? widget.post.postedBy : "John Doe";
    return FieldNameAndValue(
      fieldName: LocalizedWidgetStrings.postedByToLocalized(),
      valueChild: UserInfoColumn(
        citizenPoints: _citizenPoints,
        alignment: MainAxisAlignment.start,
        name: name,
      ),
    );
  }

  Widget _date() {
    return Text(
      LocalizedCommunityStrings.dateTimeToLocaleString(widget.post.postDate,
          needsHrs: true),
      style: TextStyle(fontSize: 12),
    );
  }

  Widget _contact() {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
          child: Text(
            LocalizedCommunityStrings.contactToLocalized(),
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => {
                Navigator.of(context).pop(),
                showDialog(context: context, child: CitizenPointUpdateDialog())
              }),
    );
  }
}
