import 'package:demoflight/app/app_notifier.dart';
import 'package:demoflight/utilities/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNotifier notifier = context.watch<AppNotifier>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: notifier.title,
      locale: notifier.locale,
      supportedLocales: notifier.locales,
      localizationsDelegates: notifier.localizationsDelegates,
      localeResolutionCallback: (locale, supportedLocales) =>
          notifier.localeResolutionCallback(locale, supportedLocales),
    );
  }
}
