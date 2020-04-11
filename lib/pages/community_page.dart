import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _communityNavigationButton("Carpool", "/carpool", context),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            _communityNavigationButton("Market", "/market", context),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            _communityNavigationButton("Help services", "/communityHelp", context),
          ],
        )),
      ),
    );
  }

  Widget _communityNavigationButton(String title, String route, BuildContext context) {
    return RaisedButton(
      color: AppColor.button.color(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 30,
            color: AppColor.buttonText.color(),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      onPressed: () => {Navigator.of(context).pushNamed(route)},
    );
  }
}
