import 'dart:convert';
import 'dart:io';

import '../models/daily_cards.dart';
import 'package:http/http.dart' as http;

const String _BASE_URL = "https://english-academy-13995.firebaseio.com";

class CardService {
  static CardService _instance;

  static CardService getInstance() {
    if (_instance == null) {
      _instance = CardService._init();
    }
    return _instance;
  }

  CardService._init();

  Future<DailyCards> getDailyCards() async {
    final response = await http.get("$_BASE_URL/dailyCards.json");

    if (response.statusCode == HttpStatus.ok) {
      return DailyCards.fromJson(json.decode(response.body));
    } else {
      return Future.error(response.statusCode);
    }
  }
}
