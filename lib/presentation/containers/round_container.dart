import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/item.dart';
import 'package:cores/domain/state_selectors.dart';
import 'package:cores/presentation/widgets/round.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RoundContainer extends StatefulWidget {
  @override
  _RoundContainerState createState() => _RoundContainerState();
}

class _RoundContainerState extends State<RoundContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) => RoundWidget(
            onTimeRunOut: vm.onTimeRunOut,
            onRightItemTapped: vm.onRightItemTapped,
            items: vm.items,
            colorName: vm.colorName,
          ),
    );
  }
}

class _ViewModel {
  final void Function() onTimeRunOut;
  final void Function() onRightItemTapped;
  final List<Item> items;
  final String colorName;

  _ViewModel({
    this.onTimeRunOut,
    this.onRightItemTapped,
    this.items,
    this.colorName,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        onTimeRunOut: () =>
            print("Auto fire go to next round but from time running out"),
        onRightItemTapped: () => print("Auto fire go to next round"),
        items: currentRoundItemsSelector(store.state),
        colorName: currentCorrectColorNameSelector(store.state),
      );
}
