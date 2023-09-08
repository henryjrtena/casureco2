import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/features/signup_page/signup_page_connector.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthChangesHandler extends StatelessWidget {
  const AuthChangesHandler({
    this.route = SignInPageConnector.route,
    super.key,
  });

  final String route;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data;

          final appUserInfo = AppUserInfo(
            displayName: user?.displayName,
            userId: user?.uid,
            email: user?.email,
            photoUrl: user?.photoURL,
          );

          return HomePageConnector(appUserInfo: appUserInfo);
        }

        switch (route) {
          case SignUpPageConnector.route:
            return SignUpPageConnector();
          default:
            return SignInPageConnector();
        }
      }),
    );
  }
}
