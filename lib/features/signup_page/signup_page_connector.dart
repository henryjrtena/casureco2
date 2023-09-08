import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/signup_page/signup_page.dart';
import 'package:casureco/features/signup_page/signup_page_vm.dart';
import 'package:casureco/state/app_state.dart';
import 'package:flutter/material.dart';

class SignUpPageConnector extends StatelessWidget {
  static const route = '/signup';

  const SignUpPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SignUpPageVm>(
      vm: () => SignUpPageVmFactory(),
      builder: (context, vm) => SignUpPage(
        onFirebaseSignUp: vm.onFirebaseSignUp,
      ),
    );
  }
}
