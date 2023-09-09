import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/home_page/home_page.dart';
import 'package:casureco/features/home_page/home_page_vm.dart';
import 'package:casureco/handler/api_manager.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/actions/auth_user_actions.dart';
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
      onInit: (store) => store..dispatchAsync(SaveAuthUserAction(appUserInfo: appUserInfo)),
      builder: (context, vm) => StreamBuilder<List<Feeder>>(
        stream: getIt<ApiManager>().getAllFeedersStream(),
        builder: (context, snapshot) {
          final feeders = snapshot.data ?? List.empty();

          return HomePage(
            appUserInfo: vm.appUserInfo,
            onFirebaseSignOut: vm.onFirebaseSignOut,
            feeders: feeders,
          );
        },
      ),
    );
  }
}
