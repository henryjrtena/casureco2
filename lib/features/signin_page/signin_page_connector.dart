import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/signin_page/signin_page.dart';
import 'package:casureco/features/signin_page/signin_page_vm.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class SignInPageConnector extends StatelessWidget {
  static const route = '/signin';

  const SignInPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignInPageVm>(
      vm: () => SignInPageVmFactory(),
      builder: (context, vm) => SignInPage(
        onFirebaseSignIn: vm.onFirebaseSignIn,
      ),
    );
  }
}
