import 'package:cityprog/handlers/message_handler.dart';
import 'package:cityprog/styles/color_palette.dart';
import 'package:cityprog/widgets/lists/newsItem.dart';
import 'package:flutter/material.dart';
import '../database_model/database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/current_language.dart';
import 'package:cityprog/widgets/lists/eventListItem.dart';
import 'package:cityprog/widgets/lists/helpListItem.dart';
import 'package:cityprog/widgets/lists/notificationItem.dart';
import 'dart:convert';

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
                    return StreamBuilder(
                      stream: Database().getCollection('Ilmoitukset'),
                      builder: (context, snapshot3) {
                        if (!snapshot1.hasData &&
                            !snapshot2.hasData &&
                            !snapshot3.hasData) return const Text('Loading..');
                        return ListViewBuilder(
                            snapshot1.data
                                .documents, // Pass 'Apupalvelu' document results
                            snapshot1.data.documents.length,
                            snapshot2.data
                                .documents, // Pass 'Tapahtuma' document results
                            snapshot2.data.documents.length,
                            snapshot3.data.documents,
                            snapshot3.data.documents.length);
                      },
                    );
                  });
            }),
      ),
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  final helpData;
  final helpDataLength;
  final eventData;
  final eventDataLength;
  final notificationData;
  final notificationDataLength;

  ListViewBuilder(this.helpData, this.helpDataLength, this.eventData,
      this.eventDataLength, this.notificationData, this.notificationDataLength);

  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  _fetchIds() async {
    String language;
    if (CurrentLanguage.value == Language.FI) {
      language = '1';
    } else {
      language = '2';
    }
    String url;
    if (kIsWeb) {
      url =
          'https://cors-anywhere.herokuapp.com/https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents?\$filter=TemplateId%20eq%209&\$orderby=PublicDate%20desc&\$format=json';
    } else {
      url =
          'https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents?\$filter=TemplateId%20eq%209&\$orderby=PublicDate%20desc&\$format=json';
    }

    List<String> contentList20 = [];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      var i = 0;
      while (i < 20) {
        contentList20.add(json['value'][i]['ContentId'].toString());
        i++;
      }
      print(contentList20);
      return contentList20;
    } else {
      throw Exception('Failed to load resources');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fetchIds();
    return Ink(
        color: AppColor.background.color(),
        child: ListView.builder(
            padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 60),
            itemCount: widget.eventDataLength +
                widget.helpDataLength + widget.notificationDataLength +
                8, //+1 for weather card + 7 for news
            itemBuilder: (BuildContext _context, index) {
              return Column(
                children: <Widget>[
                  //Apply logic for individual data sources. Return individual list items.
                  if (!kIsWeb)
                    MessageHandler(),
                  if (index == 0)
                    Column(
                      children: <Widget>[
                        CurrentWeatherCard(),
                        Divider(),
                      ],
                    ),
                  if (index < 7)
                    FutureBuilder(
                      future: _fetchIds(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print('TÄÄLLÄ DATAA ' + snapshot.data[0]);
                          return Column(
                            children: <Widget>[
                              CurrentNewsCard(
                                  contentId: snapshot.data[index]),
                                  Divider(),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  if (index <= widget.helpDataLength - 1)
                    Column(
                      children: <Widget>[
                        _buildHelpItem(context, widget.helpData[index]),
                        Divider(),
                      ],
                    ),
                  if (index <= widget.eventDataLength - 1)
                    Column(
                      children: <Widget>[
                        _buildListItem(context, widget.eventData[index]),
                        Divider(),
                      ],
                    ),
                    if (index <= widget.notificationDataLength - 1)
                    Column(
                      children: <Widget>[
                        NotificationListTile(widget.notificationData[index]),
                        Divider(),
                      ],
                    )
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
}
