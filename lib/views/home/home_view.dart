import 'package:english_academy/components/cards/input_card.dart';
import 'package:english_academy/components/cards/text_card.dart';
import 'package:english_academy/helpers/my_size.dart';
import 'package:english_academy/init/theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildColumn(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Flexible(flex: 3, child: Placeholder()),
        Flexible(flex: 6, child: buildRow()),
        Spacer(flex: 3)
      ],
    );
  }

  Row buildRow() {
    return Row(
      children: [
        Spacer(flex: 1),
        Flexible(flex: 10, child: buildCard()),
        Spacer(flex: 1),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Günlük Kartlar"));
  }

  Card buildCard() {
    return Card(
      elevation: 0.0,
      color: MyColors.PURPLE,
      child: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        front: GestureDetector(
          onDoubleTap: () {
            cardKey.currentState.toggleCard();
          },
          child: TextCard(text: "Accurate"),
        ),
        back: GestureDetector(
          onDoubleTap: () {
            cardKey.currentState.toggleCard();
          },
          child: InputCard(),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.collections_bookmark),
    );
  }
}
