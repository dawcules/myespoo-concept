// Data model for carpool post items.

import './trade_methods.dart';

class MarketPost {
  final String title;
  final String body;
  final String postedBy;
  final DateTime postDate;
  final Trading tradeMethod;
  final Uri imageUri;

  const MarketPost(
      {this.title,
      this.body,
      this.postedBy,
      this.postDate,
      this.tradeMethod,
      this.imageUri});
}
