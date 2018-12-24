import 'package:cores/domain/models/item.dart';
import 'package:cores/presentation/utils/colorutils.dart';
import 'package:cores/presentation/widgets/ColorItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundWidget extends StatefulWidget {
  final void Function() onTimeRunOut;
  final void Function() onRightItemTapped;
  final List<Item> items;
  final String colorName;

  const RoundWidget({
    Key key,
    @required this.onTimeRunOut,
    @required this.onRightItemTapped,
    @required this.colorName,
    @required this.items,
  })  : assert(onTimeRunOut != null),
        assert(onRightItemTapped != null),
        assert(colorName != null),
        super(key: key);

  @override
  _RoundWidgetState createState() => _RoundWidgetState();
}

class _RoundWidgetState extends State<RoundWidget>
    with SingleTickerProviderStateMixin {
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

    _progressController.forward(from: 0);
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
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
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
              onTap: (item) {
                if (item.isCorrect) widget.onRightItemTapped();
              },
            ),
          ),
          Expanded(
            child: ColorItem(
              color: getColorHexFromStr(COLOR_MAP[rightItem.colorId]),
              isCorrect: rightItem.isCorrect,
              onTap: (item) {
                if (item.isCorrect) widget.onRightItemTapped();
              },
            ),
          ),
        ],
      ),
    );
  }
}
