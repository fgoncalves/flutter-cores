import 'package:cores/data/repositories/LevelsRepository.dart';
import 'package:cores/presentation/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

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
