import 'package:english_academy/components/text_progress_linear_indicator.dart';
import 'package:english_academy/helpers/my_size.dart';
import 'package:flutter/material.dart';
import 'package:english_academy/components/cards/input_card.dart';
import 'package:english_academy/components/cards/text_card.dart';
import 'package:english_academy/components/core/my_flip_card.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: AnimatedContainer(
          duration: Duration(
            microseconds: 900,
          ),
          child: buildRow()),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(title: Text("Günlük Kartlar"));
  }

  Row buildRow() {
    return Row(
      children: [
        Spacer(flex: 1),
        Flexible(flex: 10, child: buildColumn()),
        Spacer(flex: 1),
      ],
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Flexible(flex: topFlex, child: buildProgressIndicator()),
        Flexible(flex: 6, child: buildCard()),
        Spacer(flex: 3)
      ],
    );
  }

  Padding buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(MySize.percentWidth(context, 0.07)),
      child: TextProgressLinearIndicator(
        showText: true,
      ),
    );
  }

  MyFlipCard buildCard() {
    return MyFlipCard(
      cardKey: cardKey,
      frontCard: GestureDetector(
        onDoubleTap: turnCard,
        child: TextCard(text: "Accurate"),
      ),
      backCard: GestureDetector(
        onDoubleTap: turnCard,
        child: InputCard(onSubmit: handleSubmit),
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
