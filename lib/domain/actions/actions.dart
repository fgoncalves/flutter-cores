import 'package:cores/domain/models/level.dart';

class LoadLevelList {}

class LevelListNotLoaded {}

class LoadedLevelList {
  final List<Level> levels;

  const LoadedLevelList(this.levels);

  @override
  String toString() => 'LoadedLevelList{levels: $levels}';
}

class LoadLevel {
  final Level level;

  const LoadLevel(this.level);

  @override
  String toString() {
    return 'LoadLevel{level: $level}';
  }
}

class LoadedLevel {
  final Level level;

  const LoadedLevel(this.level);

  @override
  String toString() {
    return 'LoadedLevel{level: $level}';
  }
}

class GoToNextRound {}
