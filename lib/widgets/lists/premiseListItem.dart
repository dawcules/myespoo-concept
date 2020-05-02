import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/current_language.dart';
import 'dart:async';
import 'dart:convert';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:url_launcher/url_launcher.dart';

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

/* _launchURL(contentId) async {
  var url = 'http://www.espoo.fi/default.aspx?contentid=' + contentId;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
} */

void main() => runApp(CurrentPremiseCard());

class CurrentPremiseCard extends StatefulWidget {
  CurrentPremiseCard({Key key}) : super(key: key);

  @override
  _CurrentPremiseCardState createState() => _CurrentPremiseCardState();
}

class _CurrentPremiseCardState extends State<CurrentPremiseCard> {
  Future<List> futurePremise;
  var index = 0;

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
    return Container(
      color: Colors.blue[50],
      child: FutureBuilder<List>(
        future: futurePremise,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material(
              elevation: 5.0,
              child: InkWell(
                //onTap: () => _launchURL(snapshot.data[index]['type']['name']),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  snapshot.data[index]['name'][language],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Text(
                                  snapshot.data[index]['type']['name'][language],
                                  style: TextStyle(fontSize: 20),
                                ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.import_contacts),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.5)),
                        /* if (!kIsWeb)
                          CachedNetworkImage(
                            imageUrl: snapshot.data.imgUrl,
                            width: 180,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                                'assets/images/smartespoo.png',
                                width: 120,
                                height: 160),
                          ),
                        if (kIsWeb)
                          Image.asset('assets/images/smartespoo.png',
                              width: 120, height: 160), */
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
