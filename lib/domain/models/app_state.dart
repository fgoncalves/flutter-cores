import 'package:cores/domain/models/level.dart';

class AppState {
  final bool isLoadingLevels;
  final bool isLoadingNewLevel;
  final List<Level> levels;
  final Level currentLevel;

  AppState({
    this.isLoadingLevels = false,
    this.isLoadingNewLevel = false,
    this.levels = const [],
    this.currentLevel,
  });

  static AppState loading() => AppState(isLoadingLevels: true);

  AppState copy({
    bool isLoadingLevels,
    bool isLoadingNewLevel,
    List<Level> levels,
    Level currentLevel,
  }) =>
      AppState(
        isLoadingLevels: isLoadingLevels ?? this.isLoadingLevels,
        isLoadingNewLevel: isLoadingNewLevel ?? this.isLoadingNewLevel,
        levels: levels ?? this.levels,
        currentLevel: currentLevel ?? this.currentLevel,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoadingLevels == other.isLoadingLevels &&
          isLoadingNewLevel == other.isLoadingNewLevel &&
          levels == other.levels &&
          currentLevel == other.currentLevel;

  @override
  int get hashCode =>
      isLoadingLevels.hashCode ^
      isLoadingNewLevel.hashCode ^
      levels.hashCode ^
      currentLevel.hashCode;

  @override
  String toString() {
    return 'AppState{isLoadingLevels: $isLoadingLevels, isLoadingNewLevel: $isLoadingNewLevel, levels: $levels, currentLevel: $currentLevel}';
  }
}
