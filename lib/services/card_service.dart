import 'dart:convert';
import 'dart:io';

import 'package:english_academy/models/daily_card.dart';
import 'package:http/http.dart' as http;

const String _BASE_URL = "https://english-academy-13995.firebaseio.com";

class CardService {
  static Future<DailyCards> getDailyCards() async {
    final response = await http.get("$_BASE_URL/dailyCards.json");

    if (response.statusCode == HttpStatus.ok) {
      return DailyCards.fromJson(json.decode(response.body));
    } else {
      return Future.error(response.statusCode);
    }
  }
}
