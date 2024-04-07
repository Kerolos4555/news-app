import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class DarkThemeData {
  static ThemeData darkTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIconColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.deepOrange,
          ),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: HexColor('333739'),
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 30,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 15,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
        ),
      ),
      appBarTheme: AppBarTheme(
        titleSpacing: 20,
        backgroundColor: HexColor('333739'),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 28,
        ),
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
      ),
    );
  }
}
