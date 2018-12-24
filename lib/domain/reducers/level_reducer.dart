import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/level.dart';
import 'package:redux/redux.dart';

final levelReducer = combineReducers<Level>([
  TypedReducer<Level, GoToNextRound>(_goToNextRound)
]);

Level _goToNextRound(Level state, action) =>
    state.copy(currentRound: state.currentRound + 1);
