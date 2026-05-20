import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/MyWidget.dart';
import 'package:flutter_application_1/widgets/FetchData.dart';
import 'package:flutter_application_1/widgets/MyWidgetWithState.dart';

//hello

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyWidgetWithState(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 56, 5, 119),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
          foregroundColor: Colors.white,
          title: Center(child: Text('Profile')),
        ),
      ),
    ),
  );
}