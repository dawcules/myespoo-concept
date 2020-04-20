import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:cityprog/styles/color_palette.dart';
import 'dart:async';
import 'dart:convert';

Future<Weather> fetchWeather() async {
  final response =
    await http.get('https://api.openweathermap.org/data/2.5/weather?q=Espoo&lang=fi&units=metric&appid=47b4f964d6c11c890337f2f5abe51d31');

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load current weather');
    }
}

class Weather {
  final double temp;
  final String weather;
  final String icon;

  Weather({this.temp, this.weather, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      weather: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

void main() => runApp(CurrentWeatherCard());

class CurrentWeatherCard extends StatefulWidget {
  CurrentWeatherCard({Key key}) : super(key: key);

  @override
  _CurrentWeatherCardState createState() => _CurrentWeatherCardState();
}

class _CurrentWeatherCardState extends State<CurrentWeatherCard> {
  Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }
      // TODO: Create localized strings

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Image.network('https://openweathermap.org/img/wn/${snapshot.data.icon}@2x.png'),
                    Column(
                      children: <Widget>[
                        Text('Sää Espoossa nyt'),
                        Text(snapshot.data.weather[0].toUpperCase() + snapshot.data.weather.substring(1) + ', ' + snapshot.data.temp.toInt().toString() +' astetta'),
                      ],
                    ),
                  ],
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