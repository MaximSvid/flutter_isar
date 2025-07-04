import 'package:flutter/material.dart';
import 'package:flutter_datenbank_isar/screens/home/home_details_screen.dart';
import 'package:flutter_datenbank_isar/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';
/// This file defines the routes for the application using the GoRouter package.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    //! Обновить путь через id
    GoRoute(
      path: '/details',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeDetailsScreen();
      },
    ),
  ],
);
