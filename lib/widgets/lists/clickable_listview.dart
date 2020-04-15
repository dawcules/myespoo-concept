import 'package:flutter/material.dart';

class ClickList extends StatefulWidget {
  final List<String> items;

  ClickList({Key key, this.items}) : super(key: key);

  @override
  _ClickListState createState() => _ClickListState();
}

class _ClickListState extends State<ClickList> {
/*   @override
  void initState() {

  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
          itemCount: widget.items == null ? 0 : widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: new ListTile(
                            title: Text(widget.items[index]),
                            subtitle: Text(widget.items[index])),
                      ),
                      Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('assets/images/smartespoo.png')),
                    ],
                  ),
                  onTap: () => print('ADD LOGIC HERE')),
            );
          }),
    );
  }
}
