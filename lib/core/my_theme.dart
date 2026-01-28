import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primary = Color(0xFF0E3A99);
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0E3A99),
      onPrimary:Color(0xFF686868),
      secondary: Color(0xFF0E3A99),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFFF0F0F0),
      onSurface: Color(0xFF1C1C1C),
      onTertiary: Color(0xFFF0F0F0),
        secondaryFixed: Color(0xFFF4F7FF)
    ),
    textTheme: TextTheme(
      bodySmall:  GoogleFonts.inter(
        color: Color(0xFFF0F0F0),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium:  GoogleFonts.inter(
        color: Color(0xFF0E3A99),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF686868),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C1C1C),
      ),
      labelSmall: GoogleFonts.inter(
        color: Color(0xFF0E3A99),
        fontSize: 14,
        fontWeight: FontWeight.w600
      )
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(centerTitle: true),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF457AED),
      onPrimary: Color(0xFFD6D6D6),
      secondary:  Color(0xFFFFFFFF),
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFF001440),
      onSurface: Color(0xFFFFFFFF),
      onTertiary: Color(0xFFF0F0F0),
      secondaryFixed: Color(0xFF000F30)
    ),

  );
}
