import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/level.dart';
import 'package:redux/redux.dart';

final levelListReducer = combineReducers<List<Level>>([
  TypedReducer<List<Level>, LevelListNotLoaded>(_noLevelsReducer),
  TypedReducer<List<Level>, LoadedLevelList>(_levelsLoaded),
]);

List<Level> _noLevelsReducer(List<Level> state, LevelListNotLoaded action) =>
    const [];

List<Level> _levelsLoaded(List<Level> state, LoadedLevelList action) =>
    action.levels;
