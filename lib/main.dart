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
//flutter run -d chrome --web-port 8080
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FragmentHolder(
          child: MyWidget(),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 56, 5, 119),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
          foregroundColor: Colors.white,
          title: Center(child: Text('Library Management')),
        ),
      ),
    ),
  );
}