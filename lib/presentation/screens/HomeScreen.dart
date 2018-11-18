import 'package:cores/base/Screen.dart';
import 'package:cores/data/models/Level.dart';
import 'package:cores/data/repositories/LevelsRepository.dart';
import 'package:cores/presentation/utils/navutils.dart';
import 'package:cores/presentation/widgets/LevelItem.dart';
import 'package:flutter/material.dart';

import 'LevelScreen.dart';

class Home extends StatefulWidget {
  final LevelsRepository levelsRepository;

  const Home({
    Key key,
    @required this.levelsRepository,
  })  : assert(levelsRepository != null),
        super(key: key);

  @override
  HomeState createState() {
    return new HomeState(levelsRepository);
  }
}

class HomeState extends State<Home> {
  LevelsRepository _levelsRepository;
  List<Level> _levels = [];

  HomeState(this._levelsRepository) : assert(_levelsRepository != null);

  @override
  void initState() {
    _levelsRepository
        .all()
        .listen((level) => setState(() => _levels.add(level)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: 'Home',
      body: Center(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: _levels.length,
          itemBuilder: (BuildContext context, int position) =>
              _createCard(context, position),
        ),
      ),
    );
  }

  Widget _createCard(BuildContext context, int position) {
    if (position >= _levels.length) return null;

    var level = _levels[position];
    return LevelCard(
      level: level,
      onTap: (level) => navigateTo(context, (context) => LevelScreen(level)),
    );
  }
}
