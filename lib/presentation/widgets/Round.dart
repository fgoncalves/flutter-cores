import 'package:cores/presentation/widgets/ColorItem.dart';
import 'package:flutter/material.dart';

class Round extends StatefulWidget {
  final void Function() onRoundFinishedLoading;
  final int topLeftColor;
  final int topRightColor;
  final int bottomLeftColor;
  final int bottomRightColor;
  final String colorName;

  const Round({
    Key key,
    @required this.onRoundFinishedLoading,
    @required this.topLeftColor,
    @required this.topRightColor,
    @required this.bottomLeftColor,
    @required this.bottomRightColor,
    @required this.colorName,
  })  : assert(onRoundFinishedLoading != null),
        assert(topLeftColor != null),
        assert(topRightColor != null),
        assert(bottomLeftColor != null),
        assert(bottomRightColor != null),
        super(key: key);

  @override
  _RoundState createState() => _RoundState();
}

class _RoundState extends State<Round> {
  int totalTimeMillis;
  int _numberOfReadyItems;

  @override
  void initState() {
    _numberOfReadyItems = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        buildColorRow(widget.topLeftColor, widget.topRightColor),
        Text(
          widget.colorName,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        buildColorRow(widget.bottomLeftColor, widget.bottomRightColor),
      ]),
    );
  }

  Expanded buildColorRow(int left, int right) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ColorItem(
              radius: 80.0,
              color: left,
              onAnimationFinished: _onAnimationFinished,
            ),
          ),
          Expanded(
            child: ColorItem(
              radius: 80.0,
              color: right,
              onAnimationFinished: _onAnimationFinished,
            ),
          ),
        ],
      ),
    );
  }

  void _onAnimationFinished() {
    _numberOfReadyItems++;
    if (_numberOfReadyItems == 4) {
      widget.onRoundFinishedLoading();
      return;
    }
  }
}
