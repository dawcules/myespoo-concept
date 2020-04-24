// Data model for carpool post items.

import './trade_methods.dart';

class MarketPostData {
  final String title;
  final String body;
  final String uid;
  final DateTime postDate;
  final Trading tradeMethod;
  final Uri imageUri;
  final double price;

  const MarketPostData({
    this.title,
    this.body,
    this.uid,
    this.postDate,
    this.tradeMethod,
    this.imageUri,
    this.price,
  }); 

  Map<String, dynamic> toMap() => {
    'title': this.title,
    'body': this.body,
    'user': this.uid,
    'postDate': this.postDate.toIso8601String(),
    'tradeMethod': this.tradeMethod.toLocalizedString(),
    'imageUri': this.imageUri,
    'price': this.price,
  };
}
