import 'package:cores/presentation/utils/colorutils.dart';
import 'package:cores/presentation/widgets/ColorItem.dart';
import 'package:flutter/material.dart';

class Round extends StatefulWidget {
  final void Function() onRoundFinishedLoading;
  final void Function(String colorId) onItemTapped;
  final String topLeftColorId;
  final String topRightColorId;
  final String bottomLeftColorId;
  final String bottomRightColorId;
  final String colorName;

  const Round({
    Key key,
    @required this.onRoundFinishedLoading,
    @required this.onItemTapped,
    @required this.topLeftColorId,
    @required this.topRightColorId,
    @required this.bottomLeftColorId,
    @required this.bottomRightColorId,
    @required this.colorName,
  })  : assert(onRoundFinishedLoading != null),
        assert(onItemTapped != null),
        assert(topLeftColorId != null),
        assert(topRightColorId != null),
        assert(bottomLeftColorId != null),
        assert(bottomRightColorId != null),
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
        buildColorRow(
          widget.topLeftColorId,
          widget.topRightColorId,
        ),
        Text(
          widget.colorName,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        buildColorRow(
          widget.bottomLeftColorId,
          widget.bottomRightColorId,
        ),
      ]),
    );
  }

  Expanded buildColorRow(String leftColorId, String rightColorId) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ColorItem(
              radius: 80.0,
              color: getColorHexFromStr(COLOR_MAP[leftColorId]),
              onAnimationFinished: _onAnimationFinished,
              onTap: () {
                widget.onItemTapped(leftColorId);
              },
            ),
          ),
          Expanded(
            child: ColorItem(
              radius: 80.0,
              color: getColorHexFromStr(COLOR_MAP[rightColorId]),
              onAnimationFinished: _onAnimationFinished,
              onTap: () {
                widget.onItemTapped(rightColorId);
              },
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
