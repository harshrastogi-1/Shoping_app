import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MythemeData {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      backgroundColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBlue,
      accentColor: darkBlue,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
          brightness: Brightness.dark,
          elevation: 0));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkColor,
      buttonColor: lightbluishColor,
      accentColor: creamColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white)),
          brightness: Brightness.dark,
          elevation: 0));
  //colors

  static Color creamColor = Color(0xfff5f5f5);
  static Color? darkColor = Colors.grey[900];
  static Color? lightbluishColor = Colors.indigo[500];
  static Color darkBlue = Color(0xff403b58);
}
