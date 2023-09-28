import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/features/feeders_page/feeders_page_connector.dart';
import 'package:casureco/features/home_page/home_page_connector.dart';
import 'package:casureco/features/profile/profile_page.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:casureco/features/signup_page/signup_page_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Casureco2Routes {
  Casureco2Routes();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => HomePageConnector(),
        routes: <RouteBase>[
          GoRoute(
            path: 'feeders',
            builder: (BuildContext context, GoRouterState state) => FeedersConnector(),
            routes: <RouteBase>[
              GoRoute(
                path: 'feeder-details',
                name: FeederDetailsConnector.route,
                builder: (BuildContext context, GoRouterState state) {
                  final feeder = state.extra as Feeder;

                  return FeederDetailsConnector(feeder: feeder);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) => ProfilePage(),
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: '/signin',
        builder: (BuildContext context, GoRouterState state) => SignInPageConnector(),
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) => SignUpPageConnector(),
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: '/signout',
        builder: (BuildContext context, GoRouterState state) {
          final shouldSignOut = state.extra as bool;

          return SignInPageConnector(shouldSignOut: shouldSignOut);
        },
        routes: const <RouteBase>[],
      )
    ],
  );
}
