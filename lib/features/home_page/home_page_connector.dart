import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/home_page/home_page.dart';
import 'package:casureco/features/home_page/home_page_vm.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/state/actions/auth_user_actions.dart';
import 'package:casureco/state/actions/collection_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePageConnector extends StatelessWidget {
  static const route = '/';

  const HomePageConnector({
    required this.appUserInfo,
    super.key,
  });

  final AppUserInfo appUserInfo;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
      vm: () => HomePageVmFactory(),
      onInit: (store) => store
        ..dispatchAsync(SaveAuthUserAction(appUserInfo: appUserInfo))
        ..dispatchAsync(GetAllFeedersAction()),
      builder: (context, vm) => HomePage(
        appUserInfo: vm.appUserInfo,
        onFirebaseSignOut: vm.onFirebaseSignOut,
        feeders: vm.feeders,
      ),
    );
  }
}
