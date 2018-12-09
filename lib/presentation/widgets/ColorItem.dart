import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorItem extends StatefulWidget {
  final int color;
  final double radius;
  final void Function() onAnimationFinished;

  const ColorItem(
      {Key key,
      @required this.color,
      @required this.radius,
      this.onAnimationFinished})
      : super(key: key);

  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));

    _controller.addListener(() {
      if (_controller.value == 1) {
        widget.onAnimationFinished();
        return;
      }

      setState(() {});
    });

    var timer = (500 * Random().nextDouble()).toInt();

    Timer(Duration(milliseconds: timer), () => _controller.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius * _controller.value,
      backgroundColor: Color(widget.color),
    );
  }
}
