import 'package:casureco/utilities/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CasurecoTheme {
  static ThemeData get buildTheme {
    final baseTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: white,
    );

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: blue,
      secondary: yellow,
    );

    final textTheme = baseTheme.textTheme.copyWith(
      bodyLarge: TextStyle(fontWeight: FontWeight.w600),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.montserratTextTheme(textTheme),
      colorScheme: colorScheme,
    );
  }
}
