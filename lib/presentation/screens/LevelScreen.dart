import 'package:cores/base/Screen.dart';
import 'package:cores/data/models/Level.dart';
import 'package:cores/presentation/utils/colorutils.dart';
import 'package:cores/presentation/widgets/Round.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LevelScreen extends StatefulWidget {
  final Level _level;

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
    final colors = widget._level.exercises[_currentRoundIndex].colors;

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
              topLeftColor: getColorHexFromStr(COLOR_MAP[colors[0]]),
              topRightColor: getColorHexFromStr(COLOR_MAP[colors[1]]),
              bottomLeftColor: getColorHexFromStr(COLOR_MAP[colors[2]]),
              bottomRightColor: getColorHexFromStr(COLOR_MAP[colors[3]]),
              colorName:
                  widget._level.exercises[_currentRoundIndex].correctColorName,
              onRoundFinishedLoading: () => _controller.forward(),
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
