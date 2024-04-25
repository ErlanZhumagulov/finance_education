import 'package:finance_education/pages/Guide_page.dart';
import 'package:finance_education/pages/guidesSelect_page.dart';
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
        path: 'guidesSelect',
        builder: (BuildContext context, GoRouterState state) {
          return const GuidesSelectScreen();
        },
      ),
      GoRoute(
        path: 'guide/:id',
        name: 'guide',
        builder: (context,state) => GuideScreen(id: int.parse(state.pathParameters["id"].toString())),
      ),
    ],
  ),
];


