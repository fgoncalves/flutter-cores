import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/level.dart';
import 'package:cores/presentation/widgets/empty_level_list.dart';
import 'package:cores/presentation/widgets/level_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LevelListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel._fromStore,
      builder: (context, vm) {
        if (vm.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (vm.levels.isEmpty) {
          return EmptyLevelList(
            onRetryTapped: vm.onRetryTapped,
          );
        }

        return LevelList(
          levels: vm.levels,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Level> levels;
  final bool loading;
  final Function() onRetryTapped;

  _ViewModel({
    this.levels,
    this.loading,
    this.onRetryTapped,
  });

  static _ViewModel _fromStore(Store<AppState> store) => _ViewModel(
        levels: store.state.levels,
        loading: store.state.isLoadingLevels,
        onRetryTapped: () => store.dispatch(LoadLevelList()),
      );
}
