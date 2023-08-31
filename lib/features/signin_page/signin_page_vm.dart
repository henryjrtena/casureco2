import 'package:async_redux/async_redux.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/state/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPageVmFactory extends VmFactory<AppState, SignInPageConnector, Vm> {
  @override
  Vm fromStore() => SignInPageVm(onFirebaseSignIn: onFirebaseSignIn);

  Future<void> onFirebaseSignIn(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}

class SignInPageVm extends Vm {
  SignInPageVm({
    required this.onFirebaseSignIn,
  }) : super(equals: []);

  final Function(String, String) onFirebaseSignIn;
}
