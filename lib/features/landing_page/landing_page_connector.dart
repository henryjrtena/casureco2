import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/landing_page/landing_page.dart';
import 'package:casureco/features/landing_page/landing_page_vm.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class LandingPageConnector extends StatelessWidget {
  static const route = '/';

  const LandingPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LandingPageVm>(
      vm: () => LandingPageVmFactory(),
      builder: (context, vm) => const LandingPage(),
    );
  }
}
