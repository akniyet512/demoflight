import 'package:demoflight/pages/search/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:demoflight/widgets/button_widget.dart';
import 'package:go_router/go_router.dart';

import 'package:demoflight/pages/main/main_widget.dart';

abstract class MainNavigationRouteNames {
  static const String main = "/";
  static const String search = "search";
}

class AppRouter {
  static GoRouter get router => GoRouter(
        initialLocation: "/${MainNavigationRouteNames.search}",
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
            routes: [
              GoRoute(
                path: MainNavigationRouteNames.search,
                name: MainNavigationRouteNames.search,
                pageBuilder: (context, state) {
                  final Map<String, String> queryParameters =
                      state.uri.queryParameters;
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: SearchWidget(
                      cityCodeFrom: queryParameters["city_code_from"],
                      cityCodeTo: queryParameters["city_code_to"],
                      fromDate: queryParameters["from_date"],
                      toDate: queryParameters["to_date"],
                      adults: queryParameters["adults"],
                      children: queryParameters["children"],
                      infants: queryParameters["infants"],
                      cabinClass: queryParameters["cabin_class"],
                      tripType: queryParameters["trip_type"],
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  );
                },
              ),
            ],
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
