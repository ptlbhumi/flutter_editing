import'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("I am Screen3"),
        ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/Screen2'),
         child: Text("Go to Screen 2")
         ),
         ],
         ),
        color: const Color.fromARGB(255, 102, 46, 106)       
      );
  }
}