import 'package:cores/domain/models/item.dart';
import 'package:cores/presentation/utils/colorutils.dart';
import 'package:cores/presentation/widgets/ColorItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Round extends StatefulWidget {
  final void Function() onTimeRunOut;
  final void Function(String colorId) onItemTapped;
  final List<Item> items;
  final String colorName;
  final bool isLoading;

  const Round({
    Key key,
    @required this.onTimeRunOut,
    @required this.onItemTapped,
    @required this.colorName,
    @required this.items,
    @required this.isLoading,
  })  : assert(onTimeRunOut != null),
        assert(onItemTapped != null),
        assert(colorName != null),
        assert(isLoading != null),
        super(key: key);

  @override
  _RoundState createState() => _RoundState();
}

class _RoundState extends State<Round> with SingleTickerProviderStateMixin {
  AnimationController _progressController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    _progressController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 5000,
        ));

    _progressController.addListener(() {
      setState(() {});
      if (_progressController.value == 1.0) widget.onTimeRunOut();
    });

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        LinearProgressIndicator(
          value: 1.0 - _progressController.value,
        ),
        SizedBox(
          height: 24.0,
        ),
        buildColorRow(
          widget.items[0],
          widget.items[1],
        ),
        Text(
          widget.colorName,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        buildColorRow(
          widget.items[2],
          widget.items[3],
        ),
      ]),
    );
  }

  Expanded buildColorRow(Item leftItem, Item rightItem) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ColorItem(
              color: getColorHexFromStr(COLOR_MAP[leftItem.colorId]),
              isCorrect: leftItem.isCorrect,
              onTap: () {
//                widget.onItemTapped(leftItem);
              },
            ),
          ),
          Expanded(
            child: ColorItem(
              color: getColorHexFromStr(COLOR_MAP[rightItem.colorId]),
              isCorrect: rightItem.isCorrect,
              onTap: () {
//                widget.onItemTapped(rightColorId);
              },
            ),
          ),
        ],
      ),
    );
  }
}
