import 'package:casureco/classes/auth_changes.dart';
import 'package:casureco/features/feeder_details/feeder_details_connector.dart';
import 'package:casureco/features/signup_page/signup_page_connector.dart';
import 'package:casureco/handler/models/feeder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Casureco2Routes {
  Casureco2Routes();

  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => AuthChangesHandler(),
        routes: <RouteBase>[
          GoRoute(
            path: 'feeder-details',
            builder: (BuildContext context, GoRouterState state) {
              final feeder = state.extra as Feeder;

              return FeederDetailsConnector(feeder: feeder);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/signin',
        builder: (BuildContext context, GoRouterState state) => AuthChangesHandler(),
        routes: const <RouteBase>[],
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return AuthChangesHandler(route: SignUpPageConnector.route);
        },
        routes: const <RouteBase>[],
      )
    ],
  );
}
