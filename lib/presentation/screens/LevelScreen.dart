import 'package:cores/base/Screen.dart';
import 'package:cores/data/models/Level.dart';
import 'package:cores/presentation/utils/colorutils.dart';
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
  AnimationController _controller;

  _LevelScreenState(this.totalTimeMillis);

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: totalTimeMillis,
        ));

    _controller.addListener(() => setState(() {}));

    _controller.forward();
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
            buildColorRow(colors[0], colors[1]),
            Text(
              widget._level.exercises[0].correctColorName,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            buildColorRow(colors[2], colors[3]),
          ],
        ),
      ),
    );
  }

  Expanded buildColorRow(String left, String right) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Color(getColorHexFromStr(COLOR_MAP[left])),
            ),
          ),
          Expanded(
            child: CircleAvatar(
              radius: 80.0,
              backgroundColor: Color(getColorHexFromStr(COLOR_MAP[right])),
            ),
          ),
        ],
      ),
    );
  }
}
