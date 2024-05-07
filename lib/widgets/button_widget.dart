import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    this.onTap,
    required this.text,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: isLoading
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(color: textColor),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
