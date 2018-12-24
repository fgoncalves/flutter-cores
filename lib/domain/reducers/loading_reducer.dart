import 'package:cores/domain/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadLevelList>(_setLoading),
  TypedReducer<bool, LoadedLevelList>(_setNotLoading),
  TypedReducer<bool, LevelListNotLoaded>(_setNotLoading),
]);

bool _setNotLoading(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
