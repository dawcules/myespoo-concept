import 'package:cityprog/strings/widget_texts.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/dialogs/danger_dialog.dart';
import 'package:flutter/material.dart';

class IconRouteNameRow extends StatelessWidget {
  final String heroTag;
  final String routeName;
  final String route;
  final Icon icon;
  final String args;
  final bool isEmergency;

  const IconRouteNameRow({
    @required this.heroTag,
    @required this.icon,
    @required this.routeName,
    @required this.route,
    this.isEmergency = false,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight * 0.75,
            heightFactor: 1.4,
            child: Container(
              width: 175,
              height: 60,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                color: AppColor.background.color(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 4, left: 16, right: 25),
                  child: Text(
                    routeName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondary.color(),
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 62,
              height: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: AppColor.secondary.color(),
                  child: icon,
                  heroTag: heroTag,
                  onPressed: () => isEmergency
                      ? showDialog(context: context, child: DangerDialog(title: LocalizedWidgetStrings.emergencyToLocalized(),))
                      : _navigate(context),
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => isEmergency
          ? showDialog(context: context, child: DangerDialog())
          : _navigate(context),
    );
  }

  void _navigate(BuildContext context) {
    Navigator.of(context).pushNamed(route, arguments: args);
  }
}
