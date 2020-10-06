import 'package:english_academy/init/theme.dart';
import 'package:flutter/material.dart';

import './home_view_model.dart';
import '../../components/cards/input_card.dart';
import '../../components/cards/text_card.dart';
import '../../components/core/my_flip_card.dart';
import '../../components/text_progress_linear_indicator.dart';
import '../../helpers/extensions/widget_extension.dart';
import '../../helpers/my_size.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildAppBar(),
      body: AnimatedContainer(
          duration: Duration(
            microseconds: 900,
          ),
          child: buildRow()),
      floatingActionButton:
          buildFloatingActionButton().doesRender(!isOpenKeyboard),
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
        Flexible(flex: 3, child: buildProgressIndicator())
            .doesRender(!isOpenKeyboard),
        Flexible(
          flex: 6,
          child: !isCardOver
              ? buildCard()
              : Center(
                  child: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.green,
                    size: MySize.percentWidth(context, 0.8),
                  ),
                ),
        ),
        Spacer(flex: 3).doesRender(!isOpenKeyboard)
      ],
    );
  }

  Padding buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(MySize.percentWidth(context, 0.07)),
      child: TextProgressLinearIndicator(
        showText: true,
        fullValue: dailyCards != null ? dailyCards.cards.length : 10,
        value: dailyCards != null
            ? dailyCards.cards
                .where((element) => element.response != null)
                .length
            : 0,
      ),
    );
  }

  MyFlipCard buildCard() {
    return MyFlipCard(
      cardKey: cardKey,
      frontCard: GestureDetector(
        onDoubleTap: turnCard,
        child: TextCard(
          text: card != null ? card.eng : '...',
          isResponseTrue: card?.response,
          onPressedNextButon: nextCard,
        ),
      ),
      backCard: GestureDetector(
        onDoubleTap: turnCard,
        child: card?.response == null
            ? InputCard(onSubmit: handleSubmit)
            : TextCard(
                text: card != null ? card.tur : '...',
                isResponseTrue: card?.response,
                onPressedNextButon: nextCard,
              ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: pressFloatingActionButton,
      child: Icon(Icons.class_),
    );
  }
}
