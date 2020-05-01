import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/current_language.dart';
import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Premise> fetchPremise(String contentId) async {
  String language;
  if (CurrentLanguage.value == Language.FI) {
    language = '1';
  } else {
    language = '2';
  }


  final response = await http.get(url);
    // Get XML
  if (response.statusCode == 200) {

    return Premise.fromJson(json.decode(resJson));
  } else {
    throw Exception('Failed to load resources');
  }
}

_launchURL(contentId) async {
  var url = 'http://www.espoo.fi/default.aspx?contentid=' + contentId;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Premise {
  final String text;
  final String imgUrl;

  Premise({this.text, this.imgUrl});

  factory Premise.fromJson(Map<String, dynamic> json) {
 
    return Premise(
      text: json['feed']['entry'][0]['content']['m\$properties']['d\$Text']
          ['\$t'],
      imgUrl: img.toString(),
    );
  }
}

void main() => runApp(CurrentPremiseCard());

class CurrentPremiseCard extends StatefulWidget {
  final String contentId;
  CurrentPremiseCard({Key key, this.contentId}) : super(key: key);

  @override
  _CurrentPremiseCardState createState() => _CurrentPremiseCardState();
}

class _CurrentPremiseCardState extends State<CurrentPremiseCard> {
  Future<Premise> futurePremise;

  @override
  void initState() {
    super.initState();
    futurePremise = fetchPremise(widget.contentId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: FutureBuilder<Premise>(
        future: futurePremise,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material(
              elevation: 5.0,
                          child: InkWell(
                onTap: () => _launchURL(widget.contentId),
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
                                  snapshot.data.text.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(Icons.import_contacts),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.5)),
                        if (!kIsWeb)
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
                              width: 120, height: 160),
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
