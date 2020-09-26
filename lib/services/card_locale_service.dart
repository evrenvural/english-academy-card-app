import 'dart:convert';

import 'package:english_academy/models/daily_card.dart';
import 'package:english_academy/models/responsed_card.dart';
import 'package:english_academy/models/responsed_daily_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _ALL_RESPONSED_DAILY_CARDS = '/_ALL_RESPONSED_DAILY_CARDS';
const String _DAILY_CARDS = '/_DAILY_CARDS';

class CardLocaleService {
  static CardLocaleService _instance;
  static SharedPreferences _sharedPreferences;

  static Future<CardLocaleService> getInstance() async {
    if (_instance == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      print("hey");
      _instance = CardLocaleService._init();
    }
    return _instance;
  }

  CardLocaleService._init();

  List<ResponsedDailyCards> getAllResponsedDailyCards() {
    List<String> response =
        _sharedPreferences.getStringList(_ALL_RESPONSED_DAILY_CARDS);

    return response
        .map((jsonObject) =>
            ResponsedDailyCards.fromJson(json.decode(jsonObject)))
        .toList();
  }
}
