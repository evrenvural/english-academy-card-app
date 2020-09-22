import 'package:flutter/material.dart';

import 'package:english_academy/init/theme.dart';
import 'package:english_academy/views/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      title: 'İngilizce Dili Akademisi',
      home: Home(),
    );
  }
}
