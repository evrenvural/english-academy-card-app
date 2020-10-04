import 'card_model.dart';

class DailyCards {
  String date;
  List<CardModel> cards;

  DailyCards({this.date, this.cards});

  DailyCards.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['cards'] != null) {
      cards = new List<CardModel>();
      json['cards'].forEach((v) {
        cards.add(new CardModel.fromJson(v));
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
