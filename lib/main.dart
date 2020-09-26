import 'package:english_academy/controller/card_controller.dart';
import 'package:english_academy/models/daily_card.dart';
import 'package:english_academy/services/card_service.dart';
import 'package:flutter/material.dart';

import 'init/theme.dart';
import 'views/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void controlDailyCards() {
    CardController.getInstance().then((instance) {
      print(instance.checkDailyCardsAreNew().toString());
    });
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
      home: Home(),
    );
  }
}
