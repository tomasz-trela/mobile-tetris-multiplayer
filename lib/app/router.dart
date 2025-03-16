import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_tetris_multiplayer/features/game/singleplayer/game_singleplayer.dart';
import 'package:mobile_tetris_multiplayer/features/home/home_page.dart';

final _notImplemented = Scaffold(body: Center(child: Text("NotImplemented"),),);

final router = GoRouter(
  initialLocation: "/home",
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: "/singleplayer",
      builder: (context, state) => GameSingleplayerPage(),
    ),
    GoRoute(
      path: "/multiplayer",
      builder: (context, state) => _notImplemented,
    ),
    GoRoute(
      path: "/multiplayer/:inviteCode",
      builder: (context, state) {
        //final inviteCode = state.pathParameters['inviteCode']!;
        return _notImplemented;
      },
    ),
  ],
);

extension GoRouterX on GoRouter {
  void goSingleplayerPage() => go("/singleplayer");
  void goMultiplayerPage(String inviteCode) => go("/multiplayer");
  void goMultiplayerPageWithInvite(String inviteCode) => go("/multiplayer/$inviteCode");
  void goHome() => go("/home");
}