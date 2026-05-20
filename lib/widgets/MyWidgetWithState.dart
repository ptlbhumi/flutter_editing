import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountItem {
  final String title;
  final dynamic value;
  final IconData icon;
  final bool isEditable;

  AccountItem({
    required this.title,
    required this.value,
    required this.icon,
    this.isEditable = false,
  });
}

class MyWidgetWithState extends StatefulWidget {
  const MyWidgetWithState({super.key});

  @override
  State<MyWidgetWithState> createState() => _MyWidgetWithStateState();
}

class _MyWidgetWithStateState extends State<MyWidgetWithState> {
  List<AccountItem> values = [];

  Future<void> getDataFromAPI() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    var response = await http.get(url);

    print("Status Code: ${response.statusCode}");

    List<Map<String,dynamic>> rawList = List<Map<String,dynamic>>.from(jsonDecode(response.body));

    setState(() {
      values = rawList.map((item) => AccountItem(
        title: item['name'],
        value: item['email'],
        icon: Icons.account_circle,
        isEditable: true,
      )).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 244, 244, 244),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              Stack(
                alignment: Alignment.bottomCenter,

                children: [
                  const Icon(Icons.account_box_rounded, size: 128),

                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(6),
                    ),

                    child: const Text(
                      "ACTIVE",

                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),

            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: values.length,
                itemBuilder: (context, index) {
                  var item = values[index];
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.title),
                    subtitle: Text(item.value.toString()),
                    trailing: item.isEditable ? const Icon(Icons.edit) : null,
                  );
                },
              ),

              OutlinedButton(
                onPressed: () {
                  getDataFromAPI();
                },

                child: const Text("Refresh Detail"),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
