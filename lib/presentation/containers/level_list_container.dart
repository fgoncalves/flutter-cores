import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/level.dart';
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
          return Container();
        }

        return LevelList(
          levels: vm.levels,
          onTap: vm.onTap,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Level> levels;
  final bool loading;
  final Function(Level) onTap;

  _ViewModel({
    this.levels,
    this.loading,
    this.onTap,
  });

  static _ViewModel _fromStore(Store<AppState> store) => _ViewModel(
        levels: store.state.levels,
        loading: store.state.isLoadingLevels,
        onTap: (level) => print('Need to dispatch action StartLevel($level)'),
      );
}
