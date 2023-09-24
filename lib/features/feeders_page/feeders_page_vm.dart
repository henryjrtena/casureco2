import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/feeders_page/feeders_page_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/state/actions/auth_user_actions.dart';
import 'package:casureco/state/actions/collection_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FeedersVmFactory extends VmFactory<AppState, FeedersConnector, Vm> {
  @override
  Vm fromStore() => FeedersVm(
        appUserInfo: state.appUserInfo ?? const AppUserInfo(),
        onFirebaseSignOut: onFirebaseSignOut,
        feeders: state.feeders,
        updateFeedersAction: updateFeedersAction,
      );

  Future<void> onFirebaseSignOut() async {
    await FirebaseAuth.instance.signOut();
    dispatchSync(SignOutUserAction());
  }

  Future<void> updateFeedersAction(List<Feeder> feeders) => dispatchAsync(UpdateFeedersAction(feeders));
}

class FeedersVm extends Vm {
  FeedersVm(
      {required this.appUserInfo,
      required this.onFirebaseSignOut,
      required this.feeders,
      required this.updateFeedersAction})
      : super(equals: [
          appUserInfo,
          feeders,
        ]);

  final AppUserInfo appUserInfo;
  final VoidCallback onFirebaseSignOut;
  final List<Feeder> feeders;
  final ValueChanged<List<Feeder>> updateFeedersAction;
}
