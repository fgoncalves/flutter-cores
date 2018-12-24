import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/reducers/level_list_reducer.dart';
import 'package:cores/domain/reducers/loading_reducer.dart';

AppState appReducer(AppState state, action) => AppState(
      isLoadingLevels: loadingReducer(state.isLoadingLevels, action),
      levels: levelListReducer(state.levels, action),
    );
