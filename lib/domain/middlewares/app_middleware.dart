import 'package:cores/data/repositories/level_repository.dart';
import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/level.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    [LevelsRepository repository = const LevelsRepository()]) {
  return [
    TypedMiddleware<AppState, LoadLevelList>(loadLevelsMiddleware(repository)),
  ];
}

// loads the levels and dispatches a LoadedLevelList action on success and
// a LevelListNotLoaded on error
Middleware<AppState> loadLevelsMiddleware(LevelsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .all()
        .map(Level.fromEntity)
        .toList()
        .then((levels) => store.dispatch(LoadedLevelList(levels)))
        .catchError((e) => store.dispatch(LevelListNotLoaded()));

    next(action);
  };
}
