import 'package:demoflight/pages/main/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainNotifier(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    MainNotifier notifier = context.watch<MainNotifier>();
    return const Scaffold(backgroundColor: Colors.red);
  }
}
