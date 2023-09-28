import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';

class Button extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? radius;

  const Button({
    Key? key,
    required this.onTap,
    required this.text,
    this.foregroundColor,
    this.backgroundColor,
    this.padding,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor ?? ColorPath.white,
        backgroundColor: backgroundColor ?? ColorPath.primary,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
        ),
      ),
    );
  }
}
