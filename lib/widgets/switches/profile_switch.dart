import 'package:flutter/material.dart';


class ProfileSwitch extends StatelessWidget {
  const ProfileSwitch({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
    this.icon,
    this.category,
  });

  final Widget label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;
  final Icon icon;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value, category);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(width: 5,),
            Expanded(child: label),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue, category);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ProfileSwitch(
      label: 'This is the label text',
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      value: _isSelected,
      onChanged: (bool newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
    );
  }
}
*/