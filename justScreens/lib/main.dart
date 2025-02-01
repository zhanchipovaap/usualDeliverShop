import 'package:flutter/material.dart';
import 'package:testproject/sceens/categories_screen.dart';
import 'package:testproject/sceens/item_categories_screen.dart';
import 'package:testproject/sceens/splash_screen.dart';

import 'sceens/item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xffa259ff);//D9D0E3
    const canvasColor = Color(0xffF6F5F5);
    const borderColor = Color(0xffD9D0E3);
    const textColor = Color(0xff9586A8);

    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            height: 1.2,
            color: Color(0xff2D0C57),
            fontFamily: 'SFproDisplayBold',
            fontSize: 30,
          ),
          titleSmall: TextStyle(
            color: Color(0xff2D0C57),
            fontFamily: 'SFproDisplayBold',
            fontSize: 16,
          ),
          titleMedium: TextStyle(
            color: Color(0xff2D0C57),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            color: textColor,
            fontFamily: 'SFproRegular',
            fontSize: 15,
          ),
          labelMedium: TextStyle(//это на кнопки
            color: Colors.white,
            fontFamily: 'SFproText',
            fontSize: 15,
          ),
        ),
        dividerColor: borderColor,
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        indicatorColor: textColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const ItemScreen(),
    );
  }
}
