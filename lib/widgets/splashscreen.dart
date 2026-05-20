import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
      
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splashscreen(),
      );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen> {
  
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(minutes: 5),(){
      Navigator.pushReplacement(
      context, MaterialPageRoute(
          builder: (context) => const MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
       decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 23, 18, 80),
            Color.fromARGB(255, 73, 7, 124),
          ],
        ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 20),
                  child: Text(
                    'Version 1.0',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 70,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Library Management",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Never Miss your book Return date",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 248, 246, 246),
                ),
              ),
              const SizedBox(height: 220),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              const Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

             

              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Copyright © 2026 Library Management. All rights reserved.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
     
    
    
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}