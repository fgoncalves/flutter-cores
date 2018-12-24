import 'package:cores/base/Screen.dart';
import 'package:cores/data/models/level_entity.dart';
import 'package:cores/presentation/widgets/Round.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LevelScreen extends StatefulWidget {
  final LevelEntity _level;

  const LevelScreen(this._level);

  @override
  _LevelScreenState createState() => _LevelScreenState(5000);
}

class _LevelScreenState extends State<LevelScreen>
    with SingleTickerProviderStateMixin {
  int _totalTimeMillis;
  int _currentRoundIndex;
  AnimationController _controller;

  _LevelScreenState(this._totalTimeMillis);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    _currentRoundIndex = 0;

    _initRound();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var exercise = widget._level.exercises[_currentRoundIndex];
    final colors = exercise.colors;

    return Screen(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: 1.0 - _controller.value,
            ),
            SizedBox(
              height: 24.0,
            ),
            Round(
              key: Key("$_currentRoundIndex"),
              topLeftColorId: colors[0],
              topRightColorId: colors[1],
              bottomLeftColorId: colors[2],
              bottomRightColorId: colors[3],
              colorName: exercise.correctColorName,
              onRoundFinishedLoading: () => _controller.forward(),
              onItemTapped: (tappedColorId) {
                if (tappedColorId == exercise.correctColorId)
                  print("CORRECT!");
                else
                  print("WRONG!");
              },
            ),
          ],
        ),
      ),
    );
  }

  void _initRound() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: _totalTimeMillis,
        ));

    _controller.addListener(() {
      setState(() {});
      if (_controller.value == 1.0) _onTimerRunOut();
    });
  }

  void _onTimerRunOut() {
    if (_currentRoundIndex == widget._level.exercises.length - 1) {
      print("level finished");
      return;
    }

    _controller.reset();
    setState(() {
      _currentRoundIndex++;
    });
  }
}
