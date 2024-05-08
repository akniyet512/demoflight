import 'package:demoflight/widgets/icon_button/icon_button_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconButtonWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color? hoverColor;
  final String? text;
  final void Function()? onTap;

  const IconButtonWidget({
    super.key,
    required this.color,
    required this.icon,
    this.hoverColor,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IconButtonNotifier(
        color: color,
        icon: icon,
        hoverColor: hoverColor ?? color,
        text: text,
        onTap: onTap,
      ),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    IconButtonNotifier notifier = context.watch<IconButtonNotifier>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: notifier.onEnter,
      onExit: notifier.onExit,
      child: GestureDetector(
        onTap: notifier.onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: notifier.isHovered ? notifier.hoverColor : notifier.color,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                notifier.icon,
                size: 16,
                color:
                    notifier.isHovered ? notifier.hoverColor : notifier.color,
              ),
              if (notifier.text != null)
                Text(
                  notifier.text!,
                  style: TextStyle(
                    color: notifier.isHovered
                        ? notifier.hoverColor
                        : notifier.color,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
