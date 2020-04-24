// Data model for carpool post items.

import 'package:flutter/material.dart';

import './trade_methods.dart';

class CarpoolPostData implements Comparable<CarpoolPostData> {
  final String title;
  final String body;
  final String origin;
  final String destination;
  final String uid;
  final DateTime postDate;
  final DateTime date;
  final TimeOfDay timeOfDay;
  final Trading tradeMethod;
  final Uri imageUri;
  final List<String> areas;
  final int slots;

  final List<String> areasList = const [
    "Espoonlahti",
    "Kauklahti",
    "Leppävaara",
    "Matinkylä",
    "Pohjois-Espoo",
    "Tapiola",
    "Vanha-Espoo"
  ];

  const CarpoolPostData({
    this.title,
    this.body,
    this.origin,
    this.destination,
    this.uid,
    this.postDate,
    this.tradeMethod,
    this.imageUri,
    this.timeOfDay,
    this.date,
    this.areas,
    this.slots,
  });

  List<String> _chooseRandomAreas() {
    List<String> copy = areasList.toList();
    String first = (copy..shuffle()).first;
    String second = (copy..shuffle()).first;
    return [first, second];
  }

  static CarpoolPostData fromMap(Map<String, dynamic> data) {
    List<String> formatter = data["timeOfDay"].split(":");
    List<String> areas = data["areas"].cast<String>();
    return CarpoolPostData(
      title: data["title"],
      body: data["body"],
      origin: data["origin"],
      destination: data["destination"],
      uid: data["user"],
      postDate: DateTime.parse(data["postDate"]),
      tradeMethod: TradeMethodFromString.fromString(data["tradeMethod"]),
      imageUri: data["imageUri"],
      timeOfDay: TimeOfDay(hour: int.parse(formatter[0]), minute: int.parse(formatter[1])),
      date: DateTime.parse(data["date"]),
      slots: data["slots"],
      areas: areas,

    );
  }

  Map<String, dynamic> toMap({@required BuildContext context}) => {
        'title': this.title,
        'body': this.body,
        'origin': this.origin,
        'destination': this.destination,
        'user': this.uid,
        'postDate': this.postDate.toIso8601String(),
        'tradeMethod': this.tradeMethod.toLocalizedString(),
        'imageUri': this.imageUri,
        'timeOfDay': this.timeOfDay.format(context),
        'date': this.date.toIso8601String(),
        'slots': this.slots,
        'areas': _chooseRandomAreas(),
      };

  @override
  int compareTo(CarpoolPostData other) => this.postDate.day - other.postDate.day;
}
