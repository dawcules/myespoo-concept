import 'package:flutter/material.dart';

// An empty dialog with an "x" button to close it with.
// Content widget set in constructor.

class CommunityPostModal extends StatelessWidget {
  final Widget childModalContent;
  const CommunityPostModal(this.childModalContent);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.cancel, size: 40),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 40, right: 40),
              child: childModalContent,
            ),
          ],
        )),
      ),
    );
  }
}
