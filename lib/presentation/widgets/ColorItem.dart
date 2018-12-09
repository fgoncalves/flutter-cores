import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum ColorItemState { ready, inflating, shaking }

class ColorItem extends StatefulWidget {
  final int color;
  final double radius;
  final void Function() onAnimationFinished;
  final void Function() onTap;

  const ColorItem(
      {Key key,
      @required this.color,
      @required this.radius,
      this.onAnimationFinished,
      this.onTap})
      : super(key: key);

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> with TickerProviderStateMixin {
  AnimationController _inflateAnimationController;
  AnimationController _sizeAnimationController;
  ColorItemState _itemState;
  Random _random;

  @override
  void initState() {
    _itemState = ColorItemState.inflating;
    _random = Random();
    _sizeAnimationController = _getSizeAnimationController();

    _inflateAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));

    _inflateAnimationController.addListener(() {
      if (_inflateAnimationController.value == 1) {
        widget.onAnimationFinished();
        setState(() => _itemState = ColorItemState.ready);
        return;
      }

      setState(() {});
    });

    var timer = (500 * _random.nextDouble()).toInt();

    Timer(Duration(milliseconds: timer),
        () => _inflateAnimationController.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_itemState == ColorItemState.ready) {
          _sizeAnimationController.forward(from: 0.0);
          widget.onTap();
        }
      },
      child: CircleAvatar(
        radius: widget.radius * _inflateAnimationController.value -
            _sizeAnimationController.value *
                80 *
                sin(4 * pi * _sizeAnimationController.value),
        backgroundColor: Color(widget.color),
      ),
    );
  }

  AnimationController _getSizeAnimationController() {
    AnimationController controller = AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    controller.addListener(() {
      setState(() {});
    });
    return controller;
  }
}
