import 'package:flutter/material.dart';
import 'package:penta/src/colors/color_theme.dart';

class PentaTitle extends StatelessWidget {
  final String label;
  final Color? colorText;
  final double? size;
  const PentaTitle(
      {super.key, required this.label, this.colorText = neutralLight, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size ?? 44.0,
        color: colorText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
