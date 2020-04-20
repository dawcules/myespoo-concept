import 'package:cityprog/pages/navigation_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationPage(
      logoSizeMultiplier: 0.85,
    );
  }
}
