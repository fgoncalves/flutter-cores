import 'dart:async';

import 'package:cores/data/models/exercise.dart';
import 'package:cores/data/models/level_entity.dart';

class LevelsRepository {
  final List<LevelEntity> _levels;

  const LevelsRepository(
      [this._levels = const [
        LevelEntity(
          id: '1',
          title: 'Level 1',
          description: 'This is the beginning',
          image:
              'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
          exercises: [
            Exercise(
              correctColorId: "blue",
              colors: ["yellow", "blue", "green", "red"],
              correctColorName: "Azul",
            ),
            Exercise(
              correctColorId: "light-blue",
              colors: ["light-blue", "beige", "pink", "purple"],
              correctColorName: "Azul cueca",
            ),
            Exercise(
              correctColorId: "gray",
              colors: ["orange", "brown", "gray", "black"],
              correctColorName: "Cinzento",
            ),
          ],
        ),
        LevelEntity(
          id: '2',
          title: 'Level 2',
          description: 'Second',
          image:
              'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
        ),
        LevelEntity(
          id: '3',
          title: 'Level 3',
          description: 'Second',
          image:
              'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
        ),
        LevelEntity(
          id: '4',
          title: 'Level 4',
          description: 'Second',
          image:
              'https://c1.staticflickr.com/6/5464/9182591451_94c943d786_b.jpg',
        )
      ]]);

  Stream<LevelEntity> all() async* {
    for (var level in _levels) yield level;
  }
}
