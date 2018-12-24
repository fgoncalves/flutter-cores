import 'package:cores/domain/models/level.dart';
import 'package:cores/presentation/widgets/level_item.dart';
import 'package:flutter/material.dart';

class LevelList extends StatelessWidget {
  final List<Level> levels;

  const LevelList({
    Key key,
    this.levels = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: levels.length,
      itemBuilder: (BuildContext context, int position) =>
          _createCard(context, position),
    );
  }

  Widget _createCard(BuildContext context, int position) {
    if (position >= levels.length) return null;

    var level = levels[position];
    return LevelCard(
      level: level,
      onTap: (level) => print('push navigator for details'),
    );
  }
}
