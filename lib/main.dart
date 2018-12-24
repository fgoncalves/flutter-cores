import 'package:cores/domain/actions/actions.dart';
import 'package:cores/domain/middlewares/app_middleware.dart';
import 'package:cores/domain/models/app_state.dart';
import 'package:cores/domain/reducers/app_reducer.dart';
import 'package:cores/presentation/routes/routes.dart';
import 'package:cores/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Cores',
        theme: ThemeData(
          primaryColor: Colors.blueGrey[900],
          accentColor: Colors.pink[500],
        ),
        routes: {
          AppRoutes.home: (context) => Home(
              onInit: () =>
                  StoreProvider.of<AppState>(context).dispatch(LoadLevelList()))
        },
      ),
    );
  }
}
