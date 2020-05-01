// Data model for carpool post items.

import './trade_methods.dart';

final List<String> areasList = const [
    "Espoonlahti",
    "Kauklahti",
    "Leppävaara",
    "Matinkylä",
    "Pohjois-Espoo",
    "Tapiola",
    "Vanha-Espoo"
  ];

class MarketPostData implements Comparable<MarketPostData> {
  final String title;
  final String body;
  final String uid;
  final DateTime postDate;
  final Trading tradeMethod;
  final String imageUri;
  final double price;
  final String area;
  final String postedBy;

  const MarketPostData({
    this.title,
    this.body,
    this.uid,
    this.postDate,
    this.tradeMethod,
    this.imageUri,
    this.price,
    this.area,
    this.postedBy
  }); 

  Map<String, dynamic> toMap() => {
    'title': this.title,
    'body': this.body,
    'user': this.uid,
    'postDate': this.postDate.toIso8601String(),
    'tradeMethod': this.tradeMethod.toLocalizedString(),
    'imageUri': this.imageUri,
    'price': this.price,
    'area': _chooseRandomArea(),
    'postedBy': this.postedBy,
  };

  static MarketPostData fromMap(Map<String, dynamic> data) {
    return MarketPostData(
      title: data["title"],
      body: data["body"],
      uid: data["user"],
      price: data["price"],
      postDate: DateTime.parse(data["postDate"]),
      tradeMethod: TradeMethodFromString.fromString(data["tradeMethod"]),
      imageUri: data["imageUri"],
      area: data["area"],
      postedBy: data["postedBy"],

    );
  }

  String _chooseRandomArea() {
    List<String> copy = areasList.toList();
    String first = (copy..shuffle()).first;
    return first;
  }

  @override
  int compareTo(MarketPostData other) {
    return this.postDate.day - other.postDate.day;
  }
}
