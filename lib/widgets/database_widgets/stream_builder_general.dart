import 'package:cityprog/styles/color_palette.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';
import 'package:cityprog/widgets/lists/eventListItem.dart';
import 'package:cityprog/widgets/lists/helpListItem.dart';

import 'package:cityprog/widgets/weather/current_weather_item.dart';

class StreamBuilderGeneral extends StatelessWidget {
  /*  final String myQuery;
  final String category;
  StreamBuilderGeneral({this.myQuery, this.category}); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Nest StreamBuilders for each collection. Then pass the snapshots individually to ListViewBuilder
        // Must be replaced with profile specific calls
        child: StreamBuilder(
            stream: Database().getCollection('Apupalvelu'),
            builder: (context, snapshot1) {
              return StreamBuilder(
                stream: Database().getCollection('Tapahtumat'),
                builder: (context, snapshot2) {
                  if (!snapshot1.hasData && !snapshot2.hasData)
                    return const Text('Loading..');
                  return ListViewBuilder(
                      snapshot1.data.documents, // Pass 'Apupalvelu' document results
                      snapshot1.data.documents.length,
                      snapshot2.data.documents, // Pass 'Tapahtuma' document results
                      snapshot2.data.documents.length);
                },
              );
            }),
      ),
    );
  }
}

//SWagety. Pistin samaan selkeyden
class ListViewBuilder extends StatelessWidget {
  final helpData;
  final helpDataLength;
  final eventData;
  final eventDataLength;
  ListViewBuilder(
      this.helpData, this.helpDataLength, this.eventData, this.eventDataLength);

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount:
                eventDataLength + helpDataLength + 1, //+1 for weather card
            itemBuilder: (BuildContext _context, index) {
              return Column(
                children: <Widget>[
                  //Apply logic for individual data sources. Return individual list items.
                  if (index == 0)
                    CurrentWeatherCard(),
                  if (index == 0)
                    Divider(),
                  if (index <= helpDataLength - 1)
                    _buildHelpItem(context, helpData[index]),
                  //Divider(),
                  if (index <= eventDataLength - 1)
                    _buildListItem(context, eventData[index]),
                  //Divider(),
                ],
              );
            }));
  }

  Widget _buildHelpItem(BuildContext context, index) {
    return HelpListTile(index);
  }

  Widget _buildListItem(BuildContext context, index) {
    return EventListTile(index);
  }

  // Add additional listItems here
}
