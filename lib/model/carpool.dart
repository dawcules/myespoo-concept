// Data model for carpool post items.

import 'package:flutter/material.dart';

import './trade_methods.dart';

class CarpoolPostData {
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
  final String area;
  final int slots;

  final List<String> areas = const [
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
    this.area,
    this.slots,
  });

  List<String> _chooseRandomAreas() {
    List<String> copy = areas.toList();
    String first = (copy..shuffle()).first;
    String second = (copy..shuffle()).first;
    return [first, second];
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
        'areas': this.area,
        'slots': this.slots,
        'areas': _chooseRandomAreas(),
      };
}
