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
  int totalTimeMillis;
  int _numberOfReadyItems;
  AnimationController _controller;

  _LevelScreenState(this.totalTimeMillis);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    initRound();
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
    final colors = widget._level.exercises[0].colors;

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
              topLeftColor: getColorHexFromStr(COLOR_MAP[colors[0]]),
              topRightColor: getColorHexFromStr(COLOR_MAP[colors[1]]),
              bottomLeftColor: getColorHexFromStr(COLOR_MAP[colors[2]]),
              bottomRightColor: getColorHexFromStr(COLOR_MAP[colors[3]]),
              colorName: widget._level.exercises[0].correctColorName,
              onRoundFinishedLoading: () => _controller.forward(),
            ),
          ],
        ),
      ),
    );
  }

  void initRound() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: totalTimeMillis,
        ));

    _controller.addListener(() => setState(() {}));
  }
}
