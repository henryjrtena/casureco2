import 'package:casureco/features/feeders_page/feeders_page_connector.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/features/profile/profile_page.dart';
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

          switch (route) {
            case SignUpPageConnector.route:
              return SignUpPageConnector();
            case ProfilePage.route:
              return ProfilePage();
            case FeedersConnector.route:
              return FeedersConnector();
            default:
              return HomePageConnector();
          }
        }

        return SignInPageConnector();
      }),
    );
  }
}
