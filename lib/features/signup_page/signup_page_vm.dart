import 'package:async_redux/async_redux.dart';
import 'package:casureco/classes/onesignalhandler.dart';
import 'package:casureco/features/signup_page/signup_page_connector.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/actions/auth_user_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:casureco/utilities/enums/firebase_auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPageVmFactory extends VmFactory<AppState, SignUpPageConnector, Vm> {
  @override
  Vm fromStore() => SignUpPageVm(onFirebaseSignUp: onFirebaseSignUp);

  Future<void> onFirebaseSignUp(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final user = await FirebaseAuth.instance.currentUser;

      final subcriberId = await getIt<OneSignalHandler>().subcriberId;

      final appUserInfo = AppUserInfo(
        displayName: user?.displayName,
        userId: user?.uid,
        email: user?.email,
        photoUrl: user?.photoURL,
        oneSignalId: subcriberId,
      );

      dispatchAsync(SaveNewAppUserInfoAction(appUserInfo: appUserInfo));

      // return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthExceptions.EMAIL_ALREADY_IN_USE.value) {
        debugPrint('Email address already exist.');
      } else if (e.code == FirebaseAuthExceptions.INVALID_EMAIL.value) {
        debugPrint('Invalid email.');
      }

      // return false;
    }
  }
}

class SignUpPageVm extends Vm {
  SignUpPageVm({
    required this.onFirebaseSignUp,
  }) : super(equals: []);

  final Function(String, String) onFirebaseSignUp;
}
