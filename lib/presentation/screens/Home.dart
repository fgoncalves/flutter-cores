import 'package:flutter/material.dart';

import '../../base/Screen.dart';
import '../../data/models/Level.dart';
import '../../data/repositories/LevelsRepository.dart';
import '../widgets/LevelItem.dart';

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
          itemBuilder: (BuildContext context, int position) =>
              _createCard(position),
        ),
      ),
    );
  }

  LevelCard _createCard(position) {
    if (position >= _levels.length) return null;

    return LevelCard(level: _levels[position]);
  }
}
