import 'package:english_academy/helpers/my_size.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../init/theme.dart';

class MyFlipCard extends StatelessWidget {
  const MyFlipCard(
      {Key key,
      this.cardKey,
      @required this.frontCard,
      @required this.backCard})
      : super(key: key);

  final Key cardKey;
  final Widget frontCard;
  final Widget backCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MySize.percentWidth(context, 0.8),
      child: Card(
        elevation: 0.0,
        color: MyColors.PURPLE,
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          front: frontCard,
          back: backCard,
        ),
      ),
    );
  }
}
