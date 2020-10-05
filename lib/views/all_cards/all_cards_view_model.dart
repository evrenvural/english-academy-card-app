import 'package:english_academy/controller/card_controller.dart';
import 'package:english_academy/models/card_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import './all_cards.dart';

abstract class AllCardsViewModel extends State<AllCards> {
  final cardKeys = [];
  CardController cardController;

  // States
  List<CardModel> allCards = [];

  @override
  void initState() {
    fetchAllCards();
    super.initState();
  }

  void fetchAllCards() async {
    cardController = await CardController.getInstance();
    setState(() {
      allCards = cardController.getAllCardsFromLocale();
    });
    for (var card in allCards) {
      cardKeys.add(GlobalKey<FlipCardState>());
    }
  }

  void turnCard(cardIndex) {
    cardKeys[cardIndex].currentState.toggleCard();
  }
}
