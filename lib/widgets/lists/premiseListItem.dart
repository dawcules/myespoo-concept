import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/current_language.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

// TODO: Localize

Future<List> fetchPremise() async {
  List items;

  final response = await http
      .get('https://api.hel.fi/respa/v1/resource/?municipality=espoo');
  if (response.statusCode == 200) {
    items = json.decode(response.body)['results'];
    return items;
  } else {
    throw Exception('Failed to load premises');
  }
}

_launchURL(contentId) async {
  var url = 'https://varaamo.espoo.fi/resources/' + contentId;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void main() => runApp(CurrentPremiseCard());

class CurrentPremiseCard extends StatefulWidget {
  CurrentPremiseCard({Key key}) : super(key: key);

  @override
  _CurrentPremiseCardState createState() => _CurrentPremiseCardState();
}

class _CurrentPremiseCardState extends State<CurrentPremiseCard> {
  Future<List> futurePremise;

  @override
  void initState() {
    super.initState();
    futurePremise = fetchPremise();
  }

  @override
  Widget build(BuildContext context) {
    String language;
    if (CurrentLanguage.value == Language.FI) {
      language = 'fi';
    } else {
      language = 'en';
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 21,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue[50],
          child: FutureBuilder<List>(
            future: futurePremise,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (index == 20) {
                  return Padding(padding: EdgeInsets.all(30),);
                } else {
                return InkWell(
                  onTap: () {
                    _launchURL(snapshot.data[index]['id']);
                  },
                  child: Material(
                    elevation: 5,
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Text(
                        snapshot.data[index]['name'][language],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        snapshot.data[index]['type']['name'][language],
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      !kIsWeb
                          ? CachedNetworkImage(
                              imageUrl: snapshot.data[index]['images'][0]
                                      ['url'] +
                                  '?dim=350x210',
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                  'assets/images/smartespoo.png',
                                  width: 120,
                                  height: 160),
                            )
                          : Image.asset('assets/images/smartespoo.png',
                              width: 120, height: 160),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          snapshot.data[index]['description'][language],
                          maxLines: 5,
                        ),
                      ),
                      Text('Click for more'),
                    ]),
                  ),
                );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
