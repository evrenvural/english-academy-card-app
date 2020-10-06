import 'dart:convert';

import 'package:english_academy/models/card_model.dart';
import 'package:english_academy/models/daily_cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _ALL_CARDS = '/_ALL_CARDS';
const String _DAILY_CARDS = '/_DAILY_CARDS';
const String _DAILY_CARDS_SAVED_STATE = '/_DAILY_CARDS_SAVED_STATE';

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

  List<CardModel> getAllCards() {
    List<String> response = _sharedPreferences.getStringList(_ALL_CARDS);
    if (response == null) {
      return [];
    }
    return response
        .map((jsonObject) => CardModel.fromJson(json.decode(jsonObject)))
        .toList();
  }

  Future<bool> setAllCards(List<CardModel> allCards) {
    List<String> encodedCards =
        allCards.map((card) => json.encode(card.toJson())).toList();
    return _sharedPreferences.setStringList(_ALL_CARDS, encodedCards);
  }

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

  Future<bool> setIsCardsSavedToAllCards(bool isSaved) {
    return _sharedPreferences.setBool(_DAILY_CARDS_SAVED_STATE, isSaved);
  }

  bool isCardsSavedToAllCards() {
    return _sharedPreferences.getBool(_DAILY_CARDS_SAVED_STATE) != null
        ? _sharedPreferences.getBool(_DAILY_CARDS_SAVED_STATE)
        : false;
  }
}
