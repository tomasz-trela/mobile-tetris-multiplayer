import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_tetris_multiplayer/features/home/home_page.dart';

final _notImplemented = Scaffold(body: Center(child: Text("NotImplemented"),),);

final router = GoRouter(
  initialLocation: "/home",
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
    ),
  ],
);