import 'dart:async';

import '../models/Level.dart';

class LevelsRepository {
  List<Level> _levels = [
    Level(
      title: 'Level 1',
      description: 'This is the beginning',
      image: 'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
    ),
    Level(
      title: 'Level 2',
      description: 'Second',
      image: 'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
    ),
    Level(
      title: 'Level 3',
      description: 'Second',
      image: 'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
    ),
    Level(
      title: 'Level 4',
      description: 'Second',
      image: 'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
    )
  ];

  Stream<Level> all() async* {
    for (var level in _levels) yield level;
  }
}
