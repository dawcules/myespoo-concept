// Data model for carpool post items.

import './trade_methods.dart';

class MarketPostData {
  final String title;
  final String body;
  final String postedBy;
  final DateTime postDate;
  final Trading tradeMethod;
  final Uri imageUri;
  final double price;

  const MarketPostData({
    this.title,
    this.body,
    this.postedBy,
    this.postDate,
    this.tradeMethod,
    this.imageUri,
    this.price,
  });
}
