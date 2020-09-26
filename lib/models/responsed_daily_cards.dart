import 'package:english_academy/models/responsed_card.dart';

class ResponsedDailyCards {
  String date;
  List<ResponsedCard> responsedCards;

  ResponsedDailyCards({this.date, this.responsedCards});

  ResponsedDailyCards.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['ResponsedCards'] != null) {
      responsedCards = new List<ResponsedCard>();
      json['ResponsedCards'].forEach((v) {
        responsedCards.add(new ResponsedCard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.responsedCards != null) {
      data['ResponsedCards'] =
          this.responsedCards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
