import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/item.dart';
import 'package:cores/domain/state_selectors.dart';
import 'package:cores/presentation/routes/routes.dart';
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
      converter: (store) => _ViewModel.fromStore(context, store),
      builder: (context, vm) {
        if (vm.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return RoundWidget(
          key: Key(vm.colorName),
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

  factory _ViewModel.fromStore(
    BuildContext context,
    Store<AppState> store,
  ) =>
      _ViewModel(
        onTimeRunOut: _nextRoundOrEndPage(context, store),
        onRightItemTapped: _nextRoundOrEndPage(context, store),
        items: currentRoundItemsSelector(store.state),
        colorName: currentCorrectColorNameSelector(store.state),
        isLoading: isLoadingNewLevel(store.state),
      );

  static void Function() _nextRoundOrEndPage(
    BuildContext context,
    Store<AppState> store,
  ) =>
      () {
        if (store.state.currentLevel.isInLastRound()) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.end_page);
        } else {
          store.dispatch(GoToNextRound());
        }
      };
}
