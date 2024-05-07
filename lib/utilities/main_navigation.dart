import 'package:flutter/material.dart';
import 'package:demoflight/widgets/button_widget.dart';
import 'package:go_router/go_router.dart';

import 'package:demoflight/pages/main/main_widget.dart';

abstract class MainNavigationRouteNames {
  static const String main = "/";
}

class AppRouter {
  static GoRouter get router => GoRouter(
        routes: <GoRoute>[
          GoRoute(
            path: MainNavigationRouteNames.main,
            name: MainNavigationRouteNames.main,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const MainWidget(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
            routes: const [],
          ),
        ],
        errorPageBuilder: (context, state) {
          return MaterialPage(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Navigation error!"),
                    ButtonWidget(
                      text: "Go to main",
                      onTap: () {
                        context.pushReplacement(
                          context.namedLocation(MainNavigationRouteNames.main),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
