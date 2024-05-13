import 'package:demoflight/widgets/button_widget.dart';
import 'package:demoflight/widgets/search_section/search_section_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

class SearchSectionWidget extends StatelessWidget {
  const SearchSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchSectionNotifier(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    SearchSectionNotifier notifier = context.watch<SearchSectionNotifier>();
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Откуда",
              hintStyle: TextStyle(),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              fillColor: Colors.transparent,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.zero),
            ),
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Куда",
              hintStyle: TextStyle(),
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              fillColor: Colors.transparent,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.zero),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: Row(
              children: [
                Expanded(child: Text("Дата туда")),
                Icon(Icons.calendar_month),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: Row(
              children: [
                Expanded(child: Text("Дата обратно")),
                Icon(Icons.calendar_month),
              ],
            ),
          ),
        ),
        Expanded(
          child: StatefulBuilder(
            builder: (context, snapshot) {
              return InkWell(
                onTap: () async {
                  await showPopover(
                    context: context,
                    bodyBuilder: (context) {
                      return ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          Text("Взрослые(+12)"),
                          Row(
                            children: [
                              Icon(Icons.remove_circle),
                              Expanded(child: TextField()),
                              Icon(Icons.add_circle),
                            ],
                          ),
                          Text("Дети(2-14)"),
                          Row(
                            children: [
                              Icon(Icons.remove_circle),
                              Expanded(child: TextField()),
                              Icon(Icons.add_circle),
                            ],
                          ),
                          Text("Младенцы(0-2)"),
                          Row(
                            children: [
                              Icon(Icons.remove_circle),
                              Expanded(child: TextField()),
                              Icon(Icons.add_circle),
                            ],
                          ),
                          Text(
                              "Международные перелеты: дети с 2 до 11 лет включительно"),
                          Text("Класс"),
                          Row(
                            children: [
                              Expanded(child: Text("Эконом")),
                              Expanded(child: Text("Бизнес")),
                            ],
                          ),
                        ],
                      );
                    },
                    height: 330,
                    width: 196,
                  );
                },
                hoverColor: Colors.transparent,
                child: Row(
                  children: [
                    Expanded(child: Text("1 взр., эконом")),
                    Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ButtonWidget(text: "Найти билеты"),
        ),
      ],
    );
  }
}
