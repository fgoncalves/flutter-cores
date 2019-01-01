import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/models/color_item.dart';
import 'package:cores/presentation/widgets/color_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LevelEndPageContainer extends StatefulWidget {
  @override
  _LevelEndPageContainerState createState() => _LevelEndPageContainerState();
}

class _LevelEndPageContainerState extends State<LevelEndPageContainer> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => ColorList(
            colors: vm.colors,
          ),
    );
  }
}

class _ViewModel {
  final List<ColorItem> colors;

  const _ViewModel({
    this.colors,
  });

  factory _ViewModel.fromStore(Store<AppState> store) {
    return _ViewModel(
        colors: store.state.currentLevel.rounds
            .expand((round) => round.items
                .where((item) => item.isCorrect)
                .map((item) => item.color))
            .toList());
  }
}
