import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        primaryColor: Color(0xFF82b479),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF565656)),
        ), colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF82b479),
        onPrimary: Colors.white,
        secondary: Color(0xFF82b479),
        onSecondary: Colors.white,
        background: Color(0xFFf2faf0),
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        error: Colors.red,
        onError: Colors.white,
      ).copyWith(background: Color(0xFFf2faf0)),
      ),
      home: HomeScreen(),
    );
  }
}
