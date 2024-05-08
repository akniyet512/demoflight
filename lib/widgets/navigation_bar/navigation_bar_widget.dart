import 'package:demoflight/widgets/icon_button/icon_button_widget.dart';
import 'package:demoflight/widgets/navigation_bar/navigation_bar_notifier.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationBarNotifier(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    NavigationBarNotifier notifier = context.watch<NavigationBarNotifier>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: Image.asset(
              "assets/images/logo.png",
              width: 64,
              height: 64,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButtonWidget(
                color: const Color.fromRGBO(132, 136, 132, 1),
                hoverColor: Colors.purple,
                icon: Icons.logout,
                onTap: () {},
              ),
              const SizedBox(width: 16),
              StatefulBuilder(
                builder: (context, snapshot) {
                  return IconButtonWidget(
                    color: const Color.fromRGBO(132, 136, 132, 1),
                    hoverColor: Colors.purple,
                    icon: Icons.grid_on_rounded,
                    onTap: () async {
                      await showPopover(
                        context: context,
                        bodyBuilder: (context) {
                          return ListView(
                            padding: const EdgeInsets.all(8),
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text("Возврат и обмен"),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text("Помощь"),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text("Новости"),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text("Контакты"),
                                ),
                              ),
                            ],
                          );
                        },
                        height: 130,
                        width: 144,
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              StatefulBuilder(builder: (context, snapshot) {
                return IconButtonWidget(
                  color: const Color.fromRGBO(132, 136, 132, 1),
                  hoverColor: Colors.purple,
                  icon: Icons.language,
                  text: "Рус",
                  onTap: () async {
                    await showPopover(
                      context: context,
                      bodyBuilder: (context) {
                        return ListView(
                          padding: const EdgeInsets.all(8),
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Рус"),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Қаз"),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Text("Eng"),
                              ),
                            ),
                          ],
                        );
                      },
                      height: 102,
                      width: 144,
                    );
                  },
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
