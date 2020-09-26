import 'package:english_academy/services/card_service.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  final cardKey = GlobalKey<FlipCardState>();
  final keyboardVisibility = KeyboardVisibilityNotification();

  int keyboardSubscriberId;

  // state
  bool isOpenKeyboard = false;

  @override
  void initState() {
    keyboardSubscriberId = keyboardVisibility.addNewListener(
      onChange: onKeyboardVisualChange,
    );
    super.initState();
  }

  @override
  void dispose() {
    keyboardVisibility.removeListener(keyboardSubscriberId);
    super.dispose();
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

  void handleSubmit(String inputValue) {
    print(inputValue);
    turnCard();
  }
}
