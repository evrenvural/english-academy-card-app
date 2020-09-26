import 'package:english_academy/models/card.dart';

class DailyCards {
  String date;
  List<Card> cards;

  DailyCards({this.date, this.cards});

  DailyCards.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['cards'] != null) {
      cards = new List<Card>();
      json['cards'].forEach((v) {
        cards.add(new Card.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.cards != null) {
      data['cards'] = this.cards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
