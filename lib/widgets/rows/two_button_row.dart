import 'package:flutter/material.dart';

import '../../styles/color_palette.dart';

// Two buttons in a row with padding of 20 in between.
// Onpress events and text contents defined
// as constructor arguments.

class TwoButtonRow extends StatelessWidget {
  final Function onPressedLeft;
  final Function onPressedRight;
  final String textLeft;
  final String textRight;

  const TwoButtonRow({
    @required this.textLeft,
    @required this.textRight,
    this.onPressedLeft,
    this.onPressedRight,
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
                padding: const EdgeInsets.only(right: 10),
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
                  onPressed: () => onPressedLeft(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
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
                  onPressed: () => onPressedRight(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
