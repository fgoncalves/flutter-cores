import 'package:flutter/material.dart';

import 'data/repositories/LevelsRepository.dart';
import 'presentation/screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cores',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.pink[500],
      ),
      // TODO: This might be possible to do with injection libraries
      home: Home(levelsRepository: LevelsRepository()),
    );
  }
}
