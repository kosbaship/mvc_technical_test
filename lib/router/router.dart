import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/first/view/first_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/second/view/second_screen.dart';
import '../features/spalsh_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: SplashScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },

    ),
    GoRoute(
        path: '/home',
        name: HomeScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'firstPage',
            name: FirstScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return  FirstScreen(name: state.queryParameters['name'],);
            },
          ),
          GoRoute(
            path: 'secondPage',
            name: SecondScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return  const SecondScreen();
            },
          ),
        ]),
  ],
);
