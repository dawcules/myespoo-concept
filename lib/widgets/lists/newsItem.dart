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
  // Get XML
  if (response.statusCode == 200) {
    // Convert to JSON
    myTransformer.parse(response.body);
    var resJson = myTransformer.toGData();
    // Proceed to map Json contents to a widget
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
    if (entryList != null && entryList.length >= 2) {
      var urlString =
          entryList[2]['content']['m\$properties']['d\$Text']['\$t'];
      print(urlString);
      if (urlString != null &&
          urlString.length > 15 &&
          urlString.toString().split('"').length > 1) {
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
      width: 750,
      height: 151,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(84, 144, 240, 0.7), spreadRadius: 3),
        ],
      ),
      child: FutureBuilder<News>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5.0,
              child: InkWell(
                onTap: () => _launchURL(widget.contentId),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              Text('News',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800)),
                              Padding(
                                padding: EdgeInsets.only(bottom: 4),
                              ),
                              Text(
                                snapshot.data.text.toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Read the story',
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.5)),
                        if (!kIsWeb)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data.imgUrl,
                              width: 170,
                              height: 150,
                              fit: BoxFit.fitHeight,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.white,
                                child: Image.asset(
                                    'assets/images/smartespoo.png',
                                    width: 170,
                                    height: 150,),
                              ),
                            ),
                          ),
                        if (kIsWeb)
                          Image.asset('assets/images/smartespoo.png',
                              width: 170, height: 150),
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
