import 'package:casureco/features/landing_page/landing_page_connector.dart';
import 'package:casureco/features/signin_page/signin_page_connector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Casureco2Routes {
  Casureco2Routes();

  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LandingPageConnector();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const Placeholder();
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
