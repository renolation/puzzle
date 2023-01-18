import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reno_puzzle/features/home_screen/domains/levels.dart';
import 'package:reno_puzzle/features/play_screen/presentations/play_screen.dart';

import '../features/home_screen/presentations/home_screen.dart';


enum AppRoute {
  home,
  play,
}

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      //home
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/play',
        name: AppRoute.play.name,
        pageBuilder: (context, state) {
          final levels = state.extra as Levels;
          return MaterialPage(
            key: state.pageKey,
            child:  PlayScreen(levels: levels,),
          );
        }
      ),
      //creator
    ],
  );
});
