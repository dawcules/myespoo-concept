import 'package:cityprog/strings/danger_strings.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/buttons/universal_raised_button.dart';
import 'package:cityprog/widgets/posts/community_post_modal.dart';
import 'package:flutter/material.dart';

class DangerDialog extends StatefulWidget {
  final String title;
  const DangerDialog({this.title});

  @override
  _DangerDialogState createState() => _DangerDialogState();
}

class _DangerDialogState extends State<DangerDialog> {
  final TextStyle textStyle = TextStyle(
    fontSize: 16,
  );
  final TextStyle btnTextStyle = TextStyle(
    fontSize: 28,
    color: AppColor.buttonText.color(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: CommunityPostModal(
        _buildContent(context),
        title: widget.title ?? "Hätäpalvelu",
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8), child: _callRow());
  }

  Widget _callRow() {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColor.button.color(),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      size: 40,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    Text(
                      "112",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            onTap: () => print("tapt dat"),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                DangerStrings.droneButtonDescriptionLocalized(),
                style: TextStyle(fontSize: 20),
                maxLines: null,
              ),
            )
          ],
        ),
        Padding(padding: EdgeInsets.all(4)),
        Row(
          children: <Widget>[
            Expanded(
              child: UniversalRaisedButton(
                  padding: 16,
                  fontSize: 24,
                  title: DangerStrings.callClosetDroneToLocalized(),
                  onPressed: null //() => print("DRONE KUTSUTTU!"),
                  ),
            )
          ],
        )
      ],
    );
  }
}
