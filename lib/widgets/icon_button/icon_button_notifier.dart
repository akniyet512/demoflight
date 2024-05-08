import 'package:flutter/material.dart';

class IconButtonNotifier extends ChangeNotifier {
  final Color color;
  final IconData icon;
  final Color hoverColor;
  final String? text;
  final void Function()? onTap;

  IconButtonNotifier({
    required this.color,
    required this.icon,
    required this.hoverColor,
    required this.text,
    required this.onTap,
  });

  bool isHovered = false;

  void onEnter(event) {
    isHovered = true;
    notifyListeners();
  }

  void onExit(event) {
    isHovered = false;
    notifyListeners();
  }
}
