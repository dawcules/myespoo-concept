import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';

class ShadowedBoxContainer extends StatelessWidget {
  final List<Widget> childWidgets;
  const ShadowedBoxContainer({this.childWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primary.color(),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: childWidgets
                  ),
                );
  }
}