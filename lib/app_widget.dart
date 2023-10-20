import 'package:flutter/material.dart';
import 'package:penta/penta.dart';
import 'package:penta_highlights/src/account/select_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PentaApp extends StatelessWidget {
  const PentaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penta Highlights',
      theme: darkTheme.copyWith(
        textTheme:
            GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
      ),
      home: const SelectAccountPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
