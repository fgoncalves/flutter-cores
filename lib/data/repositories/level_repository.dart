import 'dart:async';

import 'package:cores/data/models/color_entity.dart';
import 'package:cores/data/models/level_entity.dart';
import 'package:cores/data/models/round_entity.dart';

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
          rounds: [
            RoundEntity(
              correctColorId: "blue",
              colors: [
                ColorEntity(
                  id: "yellow",
                  name: "Amarelo",
                ),
                ColorEntity(
                  id: "blue",
                  name: "Azul",
                ),
                ColorEntity(
                  id: "green",
                  name: "Verde",
                ),
                ColorEntity(
                  id: "red",
                  name: "Vermelho",
                ),
              ],
              correctColorName: "Azul",
            ),
            RoundEntity(
              correctColorId: "light-blue",
              colors: [
                ColorEntity(
                  id: "light-blue",
                  name: "Azul cueca",
                ),
                ColorEntity(
                  id: "beige",
                  name: "Bege",
                ),
                ColorEntity(
                  id: "pink",
                  name: "Côr de rosa",
                ),
                ColorEntity(
                  id: "purple",
                  name: "roxo",
                ),
              ],
              correctColorName: "Azul cueca",
            ),
            RoundEntity(
              correctColorId: "gray",
              colors: [
                ColorEntity(
                  id: "orange",
                  name: "Côr de laranja",
                ),
                ColorEntity(
                  id: "brown",
                  name: "Castanho",
                ),
                ColorEntity(
                  id: "gray",
                  name: "Cinzento",
                ),
                ColorEntity(
                  id: "black",
                  name: "Preto",
                ),
              ],
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
