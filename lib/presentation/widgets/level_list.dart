import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/level.dart';
import 'package:cores/presentation/screens/level_screen.dart';
import 'package:cores/presentation/widgets/level_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
      itemBuilder: _createCard,
    );
  }

  Widget _createCard(BuildContext context, int position) {
    if (position >= levels.length) return null;

    var level = levels[position];
    return LevelCard(
      level: level,
      onTap: (context, level) => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => LevelScreen(onInit: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(LoadLevel(level));
                }),
          )),
    );
  }
}
