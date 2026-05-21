import'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("I am Screen2"),
        ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/Screen2'),
         child: Text("Go to Screen 2")
         ),
         ],
         ),
        color: Colors.lightBlue       
      );
  }
}