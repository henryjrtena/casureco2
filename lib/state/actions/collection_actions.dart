import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:casureco/handler/api_manager.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/app_state.dart';

class GetAllFeedersAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final feeders = await getIt<ApiManager>().getAllFeeders();

    final sortedFeeders = feeders
      ..sort((a, b) {
        if (a.id == null || b.id == null) return 0;

        return a.id!.compareTo(b.id!);
      });

    return state.copyWith(feeders: sortedFeeders);
  }
}

class SetSelectedFeederAction extends ReduxAction<AppState> {
  SetSelectedFeederAction(this.feederId);

  final int feederId;

  @override
  AppState reduce() {
    final selectedFeeder = state.feeders.firstWhere((feeder) => feeder.id == feederId);

    return state.copyWith(selectedFeeder: selectedFeeder);
  }
}

class ClearSelectedFeederAction extends ReduxAction<AppState> {
  /// Set the selectedFeeder into [null] onDispose.

  @override
  AppState reduce() => state.copyWith(selectedFeeder: null);
}
