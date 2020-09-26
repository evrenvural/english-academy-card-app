import 'package:english_academy/models/daily_card.dart';
import 'package:english_academy/models/responsed_daily_cards.dart';
import 'package:english_academy/services/card_locale_service.dart';
import 'package:english_academy/services/card_service.dart';

class CardController {
  static CardController _instance;
  static CardLocaleService _cardLocaleService;

  static Future<CardController> getInstance() async {
    if (_instance == null) {
      _instance = CardController._init();
      _cardLocaleService = await CardLocaleService.getInstance();
    }
    return _instance;
  }

  CardController._init();

  Future<bool> checkDailyCardsAreNew() async {
    DailyCards dailyCards = await CardService.getDailyCards();
    List<ResponsedDailyCards> responsedCards =
        _cardLocaleService.getAllResponsedDailyCards();

    for (var responsedCard in responsedCards) {
      if (dailyCards.date == responsedCard.date) {
        return false;
      }
    }

    return true;
  }
}
