import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: childModalContent,
            ),
          ],
        )),
      ),
    );
  }
}
