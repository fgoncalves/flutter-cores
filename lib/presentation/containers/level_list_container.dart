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
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        if (vm.isLoading) {
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
  final bool isLoading;
  final Function() onRetryTapped;

  _ViewModel({
    this.levels,
    this.isLoading,
    this.onRetryTapped,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        levels: store.state.levels,
        isLoading: store.state.isLoadingLevels,
        onRetryTapped: () => store.dispatch(LoadLevelList()),
      );
}
