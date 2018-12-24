import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/reducers/level_list_reducer.dart';
import 'package:cores/domain/reducers/loading_reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, LoadLevelList>(_levelList),
  TypedReducer<AppState, LevelListNotLoaded>(_levelList),
  TypedReducer<AppState, LoadedLevelList>(_levelList),
  TypedReducer<AppState, LoadLevel>(_loadLevel),
  TypedReducer<AppState, LoadedLevel>(_loadedLevel),
]);

AppState _levelList(AppState state, action) => state.copy(
      isLoadingLevels: loadingReducer(state.isLoadingLevels, action),
      levels: levelListReducer(state.levels, action),
    );

AppState _loadLevel(AppState state, LoadLevel action) => state.copy(
      isLoadingNewLevel: loadingReducer(state.isLoadingNewLevel, action),
    );

AppState _loadedLevel(AppState state, LoadedLevel action) => state.copy(
    isLoadingNewLevel: loadingReducer(state.isLoadingNewLevel, action),
    currentLevel: action.level.copy(currentRound: 0));
