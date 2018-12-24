import 'package:cores/domain/models/level.dart';

class AppState {
  final bool isLoadingLevels;
  final List<Level> levels;

  AppState({
    this.isLoadingLevels = false,
    this.levels = const [],
  });

  static AppState loading() => AppState(isLoadingLevels: true);

  AppState copy({
    bool isLoadingLevels,
    List<Level> levels,
  }) =>
      AppState(
        isLoadingLevels: isLoadingLevels ?? this.isLoadingLevels,
        levels: levels ?? this.levels,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoadingLevels == other.isLoadingLevels &&
          levels == other.levels;

  @override
  int get hashCode => isLoadingLevels.hashCode ^ levels.hashCode;

  @override
  String toString() {
    return 'AppState{isLoadingLevels: $isLoadingLevels, levels: $levels}';
  }
}
