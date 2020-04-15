import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class IconRouteNameRow extends StatelessWidget {
  final String heroTag;
  final String routeName;
  final String route;
  final Icon icon;
  final String args;

  const IconRouteNameRow({
    @required this.heroTag,
    @required this.icon,
    @required this.routeName,
    @required this.route,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                routeName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.espooLogoText.color(),
                    fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              FloatingActionButton(
                child: icon,
                heroTag: heroTag,
                onPressed: () => _navigate(context),
              ),
            ],
          ),
        ),
      ),
      onTap: () => _navigate(context),
    );
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }
}
