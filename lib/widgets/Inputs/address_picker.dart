import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cityprog/strings/dummy_address.dart';

class AddressPicker extends StatefulWidget {
  final String hintText;
  const AddressPicker({this.hintText});

  @override
  _AddressPickerState createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  String _selectedAddress;

  @override
  void initState() {
    super.initState();
    _selectedAddress =
        widget.hintText == null ? "select address" : widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: AutoSizeText(
            _selectedAddress,
            maxLines: 2,
            maxFontSize: 30,
            minFontSize: 20,
            overflow: TextOverflow.ellipsis,
          ),
          onChanged: (newValue) => setState(() => _selectedAddress = newValue),
          items: DummyAdress.all
              .map((String value) =>
                  DropdownMenuItem(child: Text(value), value: value))
              .toList(),
        ),
      ),
    );
  }
}
