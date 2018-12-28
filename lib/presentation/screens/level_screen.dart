import 'package:cores/base/screen.dart';
import 'package:cores/presentation/containers/level_container.dart';
import 'package:flutter/material.dart';

class LevelScreen extends StatefulWidget {
  final Function() onInit;

  const LevelScreen({
    @required this.onInit,
  }) : assert(onInit != null);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      body: LevelContainer(),
    );
  }
}
