import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightThemeData {
  static ThemeData lightTheme() {
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
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      primaryColor: Colors.deepOrange,
      primarySwatch: Colors.deepOrange,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        elevation: 20,
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          size: 30,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 15,
        ),
      ),
      appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 28,
        ),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
    );
  }
}
