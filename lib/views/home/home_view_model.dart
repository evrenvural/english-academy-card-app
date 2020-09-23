import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  // States
  int topFlex = 3;

  void turnCard() {
    if (cardKey.currentState.isFront) {
      cardKey.currentState.toggleCard();
      setState(() {
        topFlex = 3;
      });
    } else {
      cardKey.currentState.toggleCard();
      setState(() {
        topFlex = 3;
      });
    }
  }

  void handleSubmit(String inputValue) {
    print(inputValue);
  }
}
