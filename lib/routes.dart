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
        path: '/details/:id',
        name: 'details',
        builder: (BuildContext context, GoRouterState state) {
          return DetailsScreen(id: int.parse(state.pathParameters['id'].toString()));
        },
      ),




    ],
  ),
];


