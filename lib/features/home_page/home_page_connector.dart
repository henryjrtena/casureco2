import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/home_page/home_page.dart';
import 'package:casureco/features/home_page/home_page_vm.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePageConnector extends StatelessWidget {
  static const route = '/';

  const HomePageConnector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
      vm: () => HomePageVmFactory(),
      builder: (context, vm) {
        if (vm.isLoggedIn) return HomePage();

        return SignInPageConnector();
      },
    );
  }
}
