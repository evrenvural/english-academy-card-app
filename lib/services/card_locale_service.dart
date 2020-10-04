import 'dart:convert';

import 'package:english_academy/models/daily_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _ALL_RESPONSED_DAILY_CARDS = '/_ALL_RESPONSED_DAILY_CARDS';
const String _DAILY_CARDS = '/_DAILY_CARDS';

class CardLocaleService {
  static CardLocaleService _instance;
  static SharedPreferences _sharedPreferences;

  static Future<CardLocaleService> getInstance() async {
    if (_instance == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _instance = CardLocaleService._init();
    }
    return _instance;
  }

  CardLocaleService._init();

  /* List<ResponsedDailyCards> getAllResponsedDailyCards() {
    List<String> response =
        _sharedPreferences.getStringList(_ALL_RESPONSED_DAILY_CARDS);
    if (response == null) {
      return null;
    }
    return response
        .map((jsonObject) =>
            ResponsedDailyCards.fromJson(json.decode(jsonObject)))
        .toList();
  } */

  Future<bool> setNewDailyCards(DailyCards dailyCards) {
    String encodedCards = json.encode(dailyCards.toJson());
    return _sharedPreferences.setString(_DAILY_CARDS, encodedCards);
  }

  DailyCards getDailyCards() {
    String encodedCards = _sharedPreferences.getString(_DAILY_CARDS);
    return encodedCards != null
        ? DailyCards.fromJson(json.decode(encodedCards))
        : null;
  }
}
