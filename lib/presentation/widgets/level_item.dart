import 'package:cores/domain/models/level.dart';
import 'package:flutter/material.dart';

import 'CircularImage.dart';

class LevelCard extends StatelessWidget {
  final Level level;
  final void Function(Level) onTap;

  const LevelCard({
    Key key,
    @required this.level,
    this.onTap,
  })  : assert(level != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(level),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularImage(
              image: level.image,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              level.title,
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
