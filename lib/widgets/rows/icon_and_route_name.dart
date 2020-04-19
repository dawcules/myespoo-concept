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
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight * 0.75,
            heightFactor: 1.75,
            child: Card(
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(420))),
              color: AppColor.background.color(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 16, right: 120),
                child: Text(
                  routeName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondary.color(),
                      fontSize: 20),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 70,
              height: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: AppColor.secondary.color(),
                  child: icon,
                  heroTag: heroTag,
                  onPressed: () => _navigate(context),
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => _navigate(context),
    );
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }
}
