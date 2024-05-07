import 'dart:io';

import 'package:demoflight/app/app_notifier.dart';
import 'package:demoflight/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:demoflight/utilities/my_http_overrides.dart';

//flutter run -d chrome --web-renderer html --web-port 5000 --web-browser-flag "--disable-web-security"
void main() async {
  //enables main to be async
  WidgetsFlutterBinding.ensureInitialized();
  //removes HandshakeException
  HttpOverrides.global = MyHttpOverrides();
  //removes # in root route
  setPathUrlStrategy();
  //model init
  final AppNotifier model = AppNotifier();

  await model.setData().whenComplete(() {
    runApp(
      ChangeNotifierProvider(
        create: (context) => model,
        child: const AppWidget(),
      ),
    );
  });
}
