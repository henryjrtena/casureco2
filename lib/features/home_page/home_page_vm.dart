import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/state/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector, Vm> {
  @override
  Vm fromStore() => HomePageVm(
        appUserInfo: state.appUserInfo ?? const AppUserInfo(),
        onFirebaseSignOut: onFirebaseSignOut,
        feeders: state.feeders,
      );

  Future<void> onFirebaseSignOut() async => await FirebaseAuth.instance.signOut();
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.appUserInfo,
    required this.onFirebaseSignOut,
    required this.feeders,
  }) : super(equals: [
          appUserInfo,
          feeders,
        ]);

  final AppUserInfo appUserInfo;
  final VoidCallback onFirebaseSignOut;
  final List<Feeder> feeders;
}
