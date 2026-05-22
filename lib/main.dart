import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/MyWidget.dart';
import 'package:flutter_application_1/widgets/FetchData.dart';
import 'package:flutter_application_1/widgets/MyWidgetWithState.dart';
import 'package:flutter_application_1/widgets/Myname.dart';
import 'package:flutter_application_1/widgets/Listing.dart';
import 'package:flutter_application_1/widgets/AddBookPage.dart';
import 'package:flutter_application_1/widgets/EditPage.dart';
import 'package:flutter_application_1/widgets/fragmentholder.dart';

//hello
//flutter run -d chrome --web-port 8080/9090
void main() {
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    themeAnimationDuration:
    const Duration(
  milliseconds: 500,
),
  theme: ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor:
        const Color.fromARGB(255, 233, 235, 239),
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Color(0xFF4A148C),
      foregroundColor:
          Colors.white,
      elevation: 5,
      centerTitle: true,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(
      backgroundColor:
          Color(0xFF6A1B9A),
      foregroundColor:
          Colors.white,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF5E35B1),
        foregroundColor:
            Colors.white,
        padding:
            const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),
      ),
    ),
    inputDecorationTheme:
        InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(15),
      ),
      enabledBorder:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(15),
        borderSide:
            BorderSide(
          color:
              Colors.grey.shade300,
        ),
      ),
      focusedBorder:
          const OutlineInputBorder(
        borderRadius:
            BorderRadius.all(
        Radius.circular(15),
        ),
        borderSide:
            BorderSide(
          color:
              Color(0xFF5E35B1),
          width: 2,
        ),
      ),
    ),
  ),
  home: Scaffold(
    appBar: AppBar(
      title:
          const Text(
        "Library Management System",
      ),
    ),
    body: FragmentHolder(
      child: MyWidget(),
    ),
  ),
)
  );
}