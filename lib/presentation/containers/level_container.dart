import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/item.dart';
import 'package:cores/domain/state_selectors.dart';
import 'package:cores/presentation/widgets/round.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LevelContainer extends StatefulWidget {
  @override
  _LevelContainerState createState() => _LevelContainerState();
}

class _LevelContainerState extends State<LevelContainer> {
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

        return RoundWidget(
          onTimeRunOut: vm.onTimeRunOut,
          onRightItemTapped: vm.onRightItemTapped,
          items: vm.items,
          colorName: vm.colorName,
        );
      },
    );
  }
}

class _ViewModel {
  final void Function() onTimeRunOut;
  final void Function() onRightItemTapped;
  final List<Item> items;
  final String colorName;
  final bool isLoading;

  _ViewModel({
    this.onTimeRunOut,
    this.onRightItemTapped,
    this.items,
    this.colorName,
    this.isLoading,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        onTimeRunOut: () => store.dispatch(GoToNextRound()),
        onRightItemTapped: () => store.dispatch(GoToNextRound()),
        items: currentRoundItemsSelector(store.state),
        colorName: currentCorrectColorNameSelector(store.state),
        isLoading: isLoadingNewLevel(store.state),
      );
}
