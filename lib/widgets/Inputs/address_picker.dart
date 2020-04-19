import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/dummy_address.dart';

class AdressPicker extends StatefulWidget {
  const AdressPicker();

  @override
  _AdressPickerState createState() => _AdressPickerState();
}

class _AdressPickerState extends State<AdressPicker> {
  String _selectedAddress = "select address";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        isExpanded: true,
        hint: AutoSizeText(
          _selectedAddress,
          maxLines: 1,
          maxFontSize: 20,
          minFontSize: 10,
          overflow: TextOverflow.ellipsis,
        ),
        onChanged: (newValue) => setState(() => _selectedAddress = newValue),
        items: DummyAdress.all
            .map((String value) =>
                DropdownMenuItem(child: Text(value), value: value))
            .toList(),
      ),
    );
  }
}
