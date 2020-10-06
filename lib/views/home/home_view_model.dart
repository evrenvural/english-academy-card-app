import 'package:english_academy/controller/card_controller.dart';
import 'package:english_academy/helpers/view_names.dart';
import 'package:english_academy/models/daily_cards.dart';
import 'package:english_academy/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import './home.dart';

abstract class HomeViewModel extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final cardKey = GlobalKey<FlipCardState>();
  final keyboardVisibility = KeyboardVisibilityNotification();

  int keyboardSubscriberId;
  CardController cardController;

  // state
  bool isOpenKeyboard = false;
  DailyCards dailyCards;
  CardModel card;
  bool isCardOver = false;

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
    DailyCards todayDailyCards = cardController.getDailyCardsFromLocale();
    CardModel notResponsedCard;
    try {
      notResponsedCard = todayDailyCards.cards
          .firstWhere((element) => element.response == null);
      setState(() {
        dailyCards = todayDailyCards;
        card = notResponsedCard;
      });
    } catch (e) {
      setState(() {
        dailyCards = todayDailyCards;
        card = null;
        isCardOver = true;
      });
    }
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
    cardController.setDailyCardsToLocale(dailyCards);
    turnCard();
  }

  void nextCard() {
    try {
      final nextCard =
          dailyCards.cards.firstWhere((element) => element.response == null);
      setState(() {
        card = nextCard;
      });
    } catch (e) {
      setState(() {
        isCardOver = true;
      });
      cardController.saveOldDailyCardsToAllCards(dailyCards);
      cardController.setIsCardsSavedToAllCardsByView(true);
    }
  }

  void pressFloatingActionButton() {
    var allSavedCards = cardController.getAllCardsFromLocale();
    if (allSavedCards.length != 0) {
      Navigator.of(context).pushNamed(ViewNames.ALL_CARDS);
    } else {
      scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Henüz tamamlanmış günlük kartınız yok.")));
    }
  }
}
