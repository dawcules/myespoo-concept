import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/rows/citizen_points.dart';
import 'package:flutter/material.dart';

class UserInfoColumn extends StatefulWidget {
  final String name;
  final Color nameColor;
  final Color pointsColor;
  final int citizenPoints;
  final MainAxisAlignment alignment;

  UserInfoColumn({
    this.name,
    this.citizenPoints,
    this.nameColor = Colors.black87,
    this.pointsColor = Colors.black87,
    this.alignment = MainAxisAlignment.center
  });

  @override
  _UserInfoColumnState createState() => _UserInfoColumnState();
}

class _UserInfoColumnState extends State<UserInfoColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: widget.alignment,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.secondary.color(),
              child: Icon(Icons.person),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.name != null ? widget.name : "John Doe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: widget.nameColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CitizenPointRow(
                    points: widget.citizenPoints,
                    textColor: widget.pointsColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
