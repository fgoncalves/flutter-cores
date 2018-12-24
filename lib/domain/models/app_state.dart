import 'package:cores/domain/models/level.dart';

class AppState {
  final bool isLoadingLevels;
  final List<Level> levels;
  final Level currentLevel;

  AppState({
    this.isLoadingLevels = false,
    this.levels = const [],
    this.currentLevel,
  });

  static AppState loading() => AppState(isLoadingLevels: true);

  AppState copy({
    bool isLoadingLevels,
    List<Level> levels,
    Level currentLevel,
  }) =>
      AppState(
        isLoadingLevels: isLoadingLevels ?? this.isLoadingLevels,
        levels: levels ?? this.levels,
        currentLevel: currentLevel ?? this.currentLevel,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoadingLevels == other.isLoadingLevels &&
          levels == other.levels &&
          currentLevel == other.currentLevel;

  @override
  int get hashCode =>
      isLoadingLevels.hashCode ^ levels.hashCode ^ currentLevel.hashCode;

  @override
  String toString() {
    return 'AppState{isLoadingLevels: $isLoadingLevels, levels: $levels, currentLevel: $currentLevel}';
  }
}
