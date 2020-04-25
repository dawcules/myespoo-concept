import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  print('https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents($contentId)/ExtendedProperties');

  final response =
    await http.get(
      'https://www.espoo.fi/api/opennc/v1/ContentLanguages($language)/Contents($contentId)/ExtendedProperties');
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
  var url = 'http://www.espoo.fi/default.aspx?contentid='+contentId;
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
      var urlString = json['feed']['entry'][2]['content']['m\$properties']['d\$Text']['\$t'];
      print(urlString);
      if (urlString != null && urlString.length > 15) {
        img = urlString.toString().split('"')[1];
      } else {
        img = 'no pic :(';
      }
  
    return News(
      text: json['feed']['entry'][0]['content']['m\$properties']['d\$Text']['\$t'],
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
      child: FutureBuilder<News>(
            future: futureNews,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InkWell(
                  onTap: () => _launchURL(widget.contentId),
                    child: Row(
                    children: <Widget>[
                      Flexible(
                      child: Text(snapshot.data.text.toString()
                        ),
                      ),
                      VerticalDivider(),
                      CachedNetworkImage(
        imageUrl: snapshot.data.imgUrl,
        height: 160,
        width: 120,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Image.asset('assets/images/smartespoo.png', width: 120, height: 160),
     ),
                    ],
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