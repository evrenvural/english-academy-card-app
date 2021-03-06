import 'package:english_academy/models/card_model.dart';

import '../models/daily_cards.dart';
import '../services/card_locale_service.dart';
import '../services/card_service.dart';

class CardController {
  static CardController _instance;
  static CardLocaleService _cardLocaleService;
  static CardService _cardService;

  static Future<CardController> getInstance() async {
    if (_instance == null) {
      _cardLocaleService = await CardLocaleService.getInstance();
      _cardService = CardService.getInstance();
      _instance = CardController._();
    }
    return _instance;
  }

  CardController._();

  // Variables
  DailyCards _dailyCards;

  // Functions
  Future<void> fetchTodayDailyCardsFromService() async {
    _dailyCards = await _cardService.getDailyCards();
  }

  bool checkDailyCardsAreNew() {
    var localeDailyCards = _cardLocaleService.getDailyCards();
    return localeDailyCards == null ||
        _dailyCards.date != localeDailyCards.date;
  }

  Future<bool> saveDailyCardsToLocaleDatabase() {
    return _cardLocaleService.setNewDailyCards(_dailyCards);
  }

  DailyCards getDailyCardsFromLocale() {
    return _cardLocaleService.getDailyCards();
  }

  Future<bool> setDailyCardsToLocale(DailyCards dailyCards) {
    return _cardLocaleService.setNewDailyCards(dailyCards);
  }

  Future<bool> saveOldDailyCardsToAllCards(DailyCards dailyCards) {
    List<CardModel> allCards = _cardLocaleService.getAllCards();
    for (var card in dailyCards.cards) {
      allCards.add(card);
    }
    return _cardLocaleService.setAllCards(allCards);
  }

  List<CardModel> getAllCardsFromLocale() {
    return _cardLocaleService.getAllCards();
  }

  Future<bool> setIsCardsSavedToAllCardsByView(bool isSaved) {
    return _cardLocaleService.setIsCardsSavedToAllCards(isSaved);
  }

  bool isCardsSavedToAllCardsByView() {
    return _cardLocaleService.isCardsSavedToAllCards();
  }
}
