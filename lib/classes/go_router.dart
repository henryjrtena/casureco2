import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/state/models/auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Casureco2Routes {
  Casureco2Routes();

  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) return const SignInPageConnector();

              final authUser = AuthUser(
                displayName: snapshot.data?.displayName,
                email: snapshot.data?.email,
                photoUrl: snapshot.data?.photoURL,
              );

              return HomePageConnector(authUser: authUser);
            }),
          );
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'feeder-details',
            builder: (BuildContext context, GoRouterState state) {
              final extra = state.extra as int;

              return FeederDetailsConnector(feederId: extra);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/signin',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPageConnector();
        },
        routes: const <RouteBase>[],
      )
    ],
  );
}
