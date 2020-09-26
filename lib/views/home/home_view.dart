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
        Flexible(flex: 6, child: buildCard()),
        Spacer(flex: 3).doesRender(!isOpenKeyboard)
      ],
    );
  }

  Padding buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(MySize.percentWidth(context, 0.07)),
      child: TextProgressLinearIndicator(
        showText: true,
        fullValue: 10,
        value: 5,
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
