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
]);

AppState _levelList(AppState state, action) => AppState(
      isLoadingLevels: loadingReducer(state.isLoadingLevels, action),
      levels: levelListReducer(state.levels, action),
      currentLevel: state.currentLevel,
    );

AppState _loadLevel(AppState state, LoadLevel action) => AppState(
    isLoadingLevels: state.isLoadingLevels,
    levels: state.levels,
    currentLevel: state.levels[action.level].copy(currentRound: 0));
