import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cityprog/strings/string_provider.dart' show Language;
import 'package:cityprog/current_language.dart';
//import 'package:cityprog/styles/color_palette.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:async';
import 'dart:convert';
//import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

Future<News> fetchNews(String contentId) async {
  final myTransformer = Xml2Json();
  String language;
  if (CurrentLanguage.value == Language.FI) {
    language = '1';
  } else {
    language = '2';
  }

  String url;
  if (kIsWeb) {
    url =
        'https://cors-anywhere.herokuapp.com/https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents($contentId)/ExtendedProperties';
  } else {
    url =
        'https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents($contentId)/ExtendedProperties';
  }

  final response = await http.get(url);
  if (response.statusCode == 200) {
    myTransformer.parse(response.body);
    var resJson = myTransformer.toGData();
    //print('PITUUS' + resJson.length.toString());
    //log(resJson);
    return News.fromJson(json.decode(resJson));
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

class News {
  final String text;
  final String imgUrl;

  News({this.text, this.imgUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    String img;
    var entryList = json['feed']['entry'];
    if (entryList != null && entryList.length >= 3) {
      var urlString =
          entryList[2]['content']['m\$properties']['d\$Text']['\$t'];
      print(urlString);
      if (urlString != null && urlString.length > 15) {
        img = urlString.toString().split('"')[1];
      } else {
        img = 'no pic :(';
      }
    } else {
      img = 'no pic :(';
    }

    return News(
      text: json['feed']['entry'][0]['content']['m\$properties']['d\$Text']
          ['\$t'],
      imgUrl: img.toString(),
    );
  }
}

void main() => runApp(CurrentNewsCard());

class CurrentNewsCard extends StatefulWidget {
  final String contentId;
  CurrentNewsCard({Key key, this.contentId}) : super(key: key);

  @override
  _CurrentNewsCardState createState() => _CurrentNewsCardState();
}

class _CurrentNewsCardState extends State<CurrentNewsCard> {
  Future<News> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews(widget.contentId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      child: FutureBuilder<News>(
        future: futureNews,
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
