
import 'package:finance_education/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: routes,
);


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
