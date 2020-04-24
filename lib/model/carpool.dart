// Data model for carpool post items.

import 'package:flutter/material.dart';

import './trade_methods.dart';

class CarpoolPostData {
  final String title;
  final String body;
  final String from;
  final String to;
  final String postedBy;
  final DateTime postDate;
  final DateTime date;
  final TimeOfDay timeOfDay;
  final Trading tradeMethod;
  final Uri imageUri;

  const CarpoolPostData({
    this.title,
    this.body,
    this.from,
    this.to,
    this.postedBy,
    this.postDate,
    this.tradeMethod,
    this.imageUri,
    this.timeOfDay,
    this.date,
  });
}
