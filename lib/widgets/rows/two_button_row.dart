import 'package:flutter/material.dart';

import '../../styles/color_palette.dart';

// Two buttons in a row with padding of 16 in between.
// Onpress events and text contents defined
// as constructor arguments.

class TwoButtonRow extends StatelessWidget {
  final Function onPressedLeft;
  final Function onPressedRight;
  final bool leftIsNull;
  final bool rightIsNull;
  final String textLeft;
  final String textRight;

  const TwoButtonRow({
    @required this.textLeft,
    @required this.textRight,
    this.onPressedLeft,
    this.onPressedRight,
    this.leftIsNull = false,
    this.rightIsNull = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: RaisedButton(
                  color: AppColor.button.color(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    child: Text(
                      textLeft,
                      style: TextStyle(
                        color: AppColor.background.color(),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: leftIsNull ? null : () => onPressedLeft(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: RaisedButton(
                  color: AppColor.button.color(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    child: Text(
                      textRight,
                      style: TextStyle(
                        color: AppColor.background.color(),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: rightIsNull ? null : () => onPressedRight(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
