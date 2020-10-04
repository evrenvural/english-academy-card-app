import 'package:english_academy/controller/card_controller.dart';
import 'package:english_academy/models/daily_cards.dart';
import 'package:english_academy/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import './home.dart';

abstract class HomeViewModel extends State<Home> {
  final cardKey = GlobalKey<FlipCardState>();
  final keyboardVisibility = KeyboardVisibilityNotification();

  int keyboardSubscriberId;
  CardController cardController;

  // state
  bool isOpenKeyboard = false;
  DailyCards dailyCards;
  CardModel card;

  @override
  void initState() {
    keyboardSubscriberId = keyboardVisibility.addNewListener(
      onChange: onKeyboardVisualChange,
    );
    fetchDailyCards();
    super.initState();
  }

  @override
  void dispose() {
    keyboardVisibility.removeListener(keyboardSubscriberId);
    super.dispose();
  }

  void fetchDailyCards() async {
    cardController = await CardController.getInstance();
    setState(() {
      dailyCards = cardController.getDailyCardsFromLocale();
      card = dailyCards.cards.firstWhere((element) => element.response == null);
    });
  }

  // listened function
  void onKeyboardVisualChange(bool visible) {
    setState(() {
      isOpenKeyboard = visible;
    });
  }

  void turnCard() {
    cardKey.currentState.toggleCard();
  }

  void handleSubmit(String value) {
    if (value == card.tur) {
      setState(() {
        card.response = true;
      });
    } else {
      setState(() {
        card.response = false;
      });
    }
    turnCard();
  }

  void nextCard() {
    try {
      final nextCard =
          dailyCards.cards.firstWhere((element) => element.response == null);
      setState(() {
        card = nextCard;
      });
      cardController.setDailyCardsToLocale(dailyCards);
    } catch (e) {
      print("bitti");
    }
  }
}
