import 'package:english_academy/helpers/action_state.dart';
import 'package:english_academy/views/error_wiev.dart';
import 'package:english_academy/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'controller/card_controller.dart';
import 'init/theme.dart';
import 'views/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ActionState viewState = ActionState.IS_LOADING;

  void controlDailyCards() async {
    var cardController = await CardController.getInstance();
    await cardController.fetchTodayDailyCardsFromService();
    if (cardController.checkDailyCardsAreNew()) {
      bool isSaved = await cardController.saveDailyCardsToLocaleDatabase();
      if (isSaved) {
        setState(() {
          viewState = ActionState.DONE;
        });
      } else {
        setState(() {
          viewState = ActionState.ERROR;
        });
      }
    } else {
      setState(() {
        viewState = ActionState.DONE;
      });
    }
  }

  @override
  void initState() {
    controlDailyCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      title: 'İngilizce Dili Akademisi',
      home: viewState == ActionState.DONE
          ? Home()
          : viewState == ActionState.IS_LOADING ? LoadingView() : ErrorView(),
    );
  }
}
