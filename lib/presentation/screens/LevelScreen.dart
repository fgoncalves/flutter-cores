import 'package:flutter/material.dart';

import '../../data/models/Level.dart';

class LevelScreen extends StatefulWidget {
  final Level _level;


  const LevelScreen(this._level);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('working'),
    );
  }
}
