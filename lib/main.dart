import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Fregmentholder.dart';
import 'package:flutter_application_1/widgets/Myname.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Library Management"),
          titleTextStyle: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
        ),
        body: FragmentHolder(
          child: MyName(
            name: "Never Miss your book Return date",
          ),
        ),
      ),
    ),
  );
}