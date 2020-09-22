import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
}
