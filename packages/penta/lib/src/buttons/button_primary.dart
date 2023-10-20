import 'package:flutter/material.dart';
import 'package:penta/penta.dart';

class PentaPrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool reverse;

  const PentaPrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((_) {
          return const EdgeInsets.all(15.0);
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              side: reverse
                  ? const BorderSide(width: 1.0, color: neutralDark)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(8));
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (reverse) {
            return colorPrimary;
          }
          return background;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (reverse) {
            return background;
          }
          return colorPrimary;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {
          return const TextStyle(fontSize: 16, color: background);
        }),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
