import 'package:flutter/material.dart';

// An empty dialog with an "x" button to close it with.
// Content widget set in constructor.

class CommunityPostModal extends StatelessWidget {
  final Widget childModalContent;
  final String title;
  const CommunityPostModal(this.childModalContent, {this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      title ?? "No title",
                      maxLines: 4,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.cancel),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
              child: childModalContent,
            ),
          ],
        )),
      ),
    );
  }
}
