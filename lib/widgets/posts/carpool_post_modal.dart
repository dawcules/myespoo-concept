import 'package:cityprog/model/carpool.dart';
import 'package:cityprog/strings/community_strings.dart';
import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/widgets/columns/user_info_column.dart';
import 'package:cityprog/widgets/containers/box_with_border.dart';
import 'package:cityprog/widgets/database_model/database.dart';
import 'package:cityprog/widgets/dialogs/citizenpoint_update.dart';
import 'package:cityprog/widgets/posts/field_name_and_value.dart';
import 'package:cityprog/widgets/rows/citizen_points.dart';
import 'package:flutter/material.dart';

class CarpoolPostModal extends StatefulWidget {
  final CarpoolPostData post;
  const CarpoolPostModal(this.post);
  static const TextStyle _style = TextStyle(
    fontSize: 20,
  );

  @override
  _CarpoolPostModalState createState() => _CarpoolPostModalState();
}

class _CarpoolPostModalState extends State<CarpoolPostModal> {
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
          padding: EdgeInsets.all(4),
        ),
        BoxWithBorder(
          borderRadius: 5,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8)),
            _originDestination(),
            Padding(padding: EdgeInsets.all(8)),
            _body(),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8),
        ),

        Align(alignment: Alignment.centerLeft, child: _user()),
        Padding(padding: EdgeInsets.all(4)),
        // _date(),
        // Padding(padding: EdgeInsets.all(16)),
        _contactButton(context),
        Padding(padding: EdgeInsets.all(8)),
      ],
    );
  }

  Widget _date() {
    return Text(
      LocalizedCommunityStrings.dateTimeToLocaleString(widget.post.postDate,
          needsHrs: true),
      style: TextStyle(fontSize: 12),
    );
  }

  Widget _body() {
    return widget.post.body != null
        ? Text(widget.post.body, style: CarpoolPostModal._style)
        : Padding(padding: EdgeInsets.all(0));
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

  Widget _contactButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FlatButton(
          child: Text(
            LocalizedCommunityStrings.contactToLocalized(),
            style: TextStyle(fontSize: 16),
          ),
          onPressed: () => {
                Navigator.of(context).pop(),
                showDialog(context: context, child: CitizenPointUpdateDialog())
              }),
    );
  }

  Widget _originDestination() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: FieldNameAndValue(
            fieldName: LocalizedCommunityStrings.fromToLocalized(),
            value: widget.post.origin,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FieldNameAndValue(
            fieldName: LocalizedCommunityStrings.destinationToLocalized(),
            value: widget.post.destination,
          ),
        ),
      ],
    );
  }
}
