import 'package:async_redux/async_redux.dart';
import 'package:casureco/classes/signin_arguments.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/state/actions/auth_user_actions.dart';
import 'package:casureco/state/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPageVmFactory extends VmFactory<AppState, SignInPageConnector, Vm> {
  @override
  Vm fromStore() => SignInPageVm(onFirebaseSignIn: onFirebaseSignIn);

  Future<void> onFirebaseSignIn(SignInArguments signInArguments) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInArguments.email,
        password: signInArguments.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    } finally {
      final user = await FirebaseAuth.instance.currentUser;

      final appUserInfo = AppUserInfo(
        displayName: user?.displayName,
        userId: user?.uid,
        email: user?.email,
        photoUrl: user?.photoURL,
      );

      await dispatchAsync(SaveAuthUserAction(
        appUserInfo: appUserInfo,
        onSuccess: signInArguments.onSuccess,
      ));
    }
  }
}

class SignInPageVm extends Vm {
  SignInPageVm({
    required this.onFirebaseSignIn,
  }) : super(equals: []);

  final ValueChanged<SignInArguments> onFirebaseSignIn;
}
