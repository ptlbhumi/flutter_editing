import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'widgets/fragmentholder.dart';
import 'widgets/MyWidget.dart';
import 'widgets/FetchData.dart';
import 'widgets/Listing.dart';
// removed import of non-existent file 'widgets/MyApp.dart'

//hello

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const FragmentHolder(
          child: MyWidget()
          ),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 166, 11, 201),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: Colors.white,
            title: Center(
              child: Text(
                "Library Management ",
                
                ),
              ),
          ),
      ),
    ),
  );
}


