import 'package:cores/base/Screen.dart';
import 'package:cores/presentation/containers/round_container.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatefulWidget {
  final int level;

  const LevelScreen(this.level) : assert(level != null);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
      body: RoundContainer(),
    );
  }
}
