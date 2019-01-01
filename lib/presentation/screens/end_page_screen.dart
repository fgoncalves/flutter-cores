import 'package:cores/base/screen.dart';
import 'package:cores/presentation/containers/level_end_container.dart';
import 'package:flutter/material.dart';

class LevelEndPageScreen extends StatefulWidget {
  @override
  LevelEndPageScreenState createState() {
    return LevelEndPageScreenState();
  }
}

class LevelEndPageScreenState extends State<LevelEndPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: 'Answers',
      body: LevelEndPageContainer(),
    );
  }
}
