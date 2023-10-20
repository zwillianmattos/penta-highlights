import 'package:flutter/material.dart';
import 'package:penta/src/colors/color_theme.dart';

class PentaInput extends StatelessWidget {
  const PentaInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 19, vertical: 19),
        prefixIcon: Padding(
          padding: EdgeInsets.all(22.0),
          child: Icon(
            Icons.search,
            color: neutralLight,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(22.0),
          child: Icon(
            Icons.tune,
            color: neutralLight,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: neutralLight,
        ),
        filled: true,
        fillColor: neutralDark,
        focusColor: neutralLight,
        hoverColor: neutralLight,
        hintText: 'Search',
      ),
    );
  }
}
