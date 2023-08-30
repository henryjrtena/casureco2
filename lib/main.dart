import 'package:async_redux/async_redux.dart';
import 'package:casureco/classes/go_router.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  final goRouter = Casureco2Routes().router;

  final initialState = AppState();

  final store = Store<AppState>(
    initialState: initialState,
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
      ),
    ),
  );
}
