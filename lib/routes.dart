import 'package:finance_education/pages/Guide_page.dart';
import 'package:finance_education/pages/guides_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/details_page.dart';
import 'pages/home_page.dart';



final routes = [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) {
          return const DetailsScreen();
        },
      ),
      GoRoute(
        path: 'guides',
        builder: (BuildContext context, GoRouterState state) {
          return const GuidesScreen();
        },
      ),
      GoRoute(
        path: 'guide/:id',
        builder: (context,state) => GuideScreen(id: state.pathParameters['id'].toString()),
      ),
    ],
  ),
];


