import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/item.dart';
import 'package:cores/domain/models/level.dart';
import 'package:cores/domain/models/round.dart';

Level currentLevelSelector(AppState state) => state.currentLevel;

Round currentRoundSelector(AppState state) {
  return currentLevelSelector(state)
    ?.rounds[currentLevelSelector(state)?.currentRound];
}

List<Item> currentRoundItemsSelector(AppState state) =>
    currentRoundSelector(state)?.items;

String currentCorrectColorNameSelector(AppState state) =>
    currentRoundSelector(state)?.colorName;

bool isLoadingNewLevel(AppState state) => state.isLoadingNewLevel;
