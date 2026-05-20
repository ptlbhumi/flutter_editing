import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets/MyWidget.dart';
import 'widgets/FetchData.dart';
import 'widgets/Listing.dart';
// removed import of non-existent file 'widgets/MyApp.dart'

//hello

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Listing(),
      ),
    ),
  );
}


