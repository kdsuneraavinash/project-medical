import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

AppTheme lightTheme() {
  Color primaryColor = Colors.white;
  Color accentColor = Colors.blue[800];

  return AppTheme(
    data: _buildThemeData(Brightness.light, primaryColor, accentColor),
    id: "light_theme",
    description: "Default Light Theme",
  );
}

AppTheme darkTheme() {
  Color primaryColor = Colors.grey[850];
  Color accentColor = Colors.amber;

  return AppTheme(
    data: _buildThemeData(Brightness.dark, primaryColor, accentColor),
    id: "dark_theme",
    description: "Default Dark Theme",
  );
}

AppTheme blackTheme() {
  Color primaryColor = Color(0xff000000);
  Color accentColor = Colors.white;

  return AppTheme(
    data: _buildThemeData(Brightness.dark, primaryColor, accentColor),
    id: "black_theme",
    description: "Black Theme",
  );
}

ThemeData _buildThemeData(
    Brightness brightness, Color primaryColor, Color accentColor) {
  return ThemeData(
    fontFamily: "Roboto",
    brightness: brightness,
    scaffoldBackgroundColor: primaryColor,
    primaryColor: primaryColor,
    accentColor: accentColor,
    iconTheme: IconThemeData(color: accentColor),
    bottomAppBarColor: primaryColor,
    primaryColorDark: primaryColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: accentColor),
      elevation: 0,
      brightness: brightness,
      actionsIconTheme: IconThemeData(color: accentColor),
      textTheme: TextTheme(
        title: TextStyle(
          color: accentColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    primaryIconTheme: IconThemeData(
      color: primaryColor,
    ),
    primaryTextTheme: TextTheme(
      subhead: TextStyle(color: primaryColor),
    ),
    cardTheme: CardTheme(elevation: 4),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primaryColor.withOpacity(0.8),
      actionTextColor: accentColor,
      contentTextStyle: TextStyle(
        color: brightness == Brightness.light ? Colors.black : Colors.white,
      ),
    ),
  );
}
