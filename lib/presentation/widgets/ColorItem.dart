import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorItem extends StatefulWidget {
  final int color;
  final bool isCorrect;
  final double radius;
  final void Function(ColorItem) onTap;
  final void Function() onReady;

  const ColorItem({
    Key key,
    @required this.color,
    @required this.isCorrect,
    this.onTap,
    this.onReady,
    this.radius = 80.0,
  }) : super(key: key);

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> with TickerProviderStateMixin {
  AnimationController _inflateAnimationController;
  AnimationController _sizeAnimationController;
  Random _random;

  @override
  void initState() {
    _random = Random();
    _sizeAnimationController = _getSizeAnimationController();

    _inflateAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));

    _inflateAnimationController.addListener(() => setState(() {}));
    _inflateAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onReady();
      }
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
        if (_inflateAnimationController.isAnimating) return;

        if (widget.isCorrect)
          widget.onTap(widget);
        else
          _sizeAnimationController.forward(from: 0.0);
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
