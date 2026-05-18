import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Future<void> getDataFromAPI()async{
    var url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: getDataFromAPI, 
      child: Text("Click me to fetch data ")
      );
  }
}