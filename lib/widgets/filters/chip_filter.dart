import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
 
  final Function onSelected;
  final data; 
  final selected;
  ChipFilter({this.onSelected,this.data, this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: List<Widget>.generate(data.length, (int index) {  
             return  FilterChip(
                label: Text(data[index]),
                onSelected: (bool value) {
                  onSelected(data[index],selected);
                },
                selected: selected.contains(data[index]),
                selectedColor: Colors.blue,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                backgroundColor: Colors.grey,
             );
          },
      ),),);
  }
}
              