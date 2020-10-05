import 'package:english_academy/components/cards/text_card.dart';
import 'package:english_academy/components/core/my_flip_card.dart';
import 'package:english_academy/components/text_progress_linear_indicator.dart';
import 'package:english_academy/helpers/my_size.dart';
import 'package:english_academy/init/theme.dart';
import 'package:english_academy/models/card_model.dart';
import 'package:flutter/material.dart';
import './all_cards_view_model.dart';

class AllCardsView extends AllCardsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tüm Kartlar")),
      body: buildRow(),
    );
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
        Flexible(flex: 3, child: buildProgressIndicator()),
        Flexible(
          flex: 6,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: allCards.length != 0
                ? [
                    ...allCards.map(
                      (card) => buildCard(
                        card,
                        allCards.indexOf(card),
                      ),
                    )
                  ]
                : [],
          ),
        ),
        Spacer(flex: 3)
      ],
    );
  }

  Padding buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(MySize.percentWidth(context, 0.07)),
      child: TextProgressLinearIndicator(
        showText: true,
        valueColor: MyColors.GREEN,
        fullValue: allCards.length != 0 ? allCards.length : 10,
        value: allCards.length != 0
            ? allCards.where((element) => element.response == true).length
            : 0,
      ),
    );
  }

  MyFlipCard buildCard(CardModel card, int cardIndex) {
    return MyFlipCard(
      cardKey: cardKeys[cardIndex],
      frontCard: GestureDetector(
        onDoubleTap: () => turnCard(cardIndex),
        child: TextCard(
            elevation: 0.0,
            text: card != null ? card.eng : '...',
            isResponseTrue: card?.response),
      ),
      backCard: GestureDetector(
        onDoubleTap: () => turnCard(cardIndex),
        child: TextCard(
            elevation: 0.0,
            text: card != null ? card.tur : '...',
            isResponseTrue: card?.response),
      ),
    );
  }
}
