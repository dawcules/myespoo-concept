import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:flutter/material.dart';

class ReportCityPropertyForm extends StatelessWidget {
  const ReportCityPropertyForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CommunityPostModal(Text("This is a report form")),
    );
  }
}