import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  List<Map<String, dynamic>> account = [
    {
      'title': 'Name',
      'value': 'Bhumi Patel',
      'icon': Icons.person,
      'isEditable': true,
    },
    {
      'title': 'Account Number',
      'value': '1234567890',
      'icon': Icons.account_balance,
      'isEditable': false,
    },
    {
      'title': 'Balance',
      'value': '10000',
      'icon': Icons.account_balance_wallet,
      'isEditable': false,
    },
    {
      'title': 'City',
      'value': 'Anand',
      'icon': Icons.location_on,
      'isEditable': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [

            Stack(
              children: [
                const Icon(Icons.account_box_rounded, size: 128),

                Positioned(
                  left: 40,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Text(
                      "Active",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            ...account.map((item) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(vertical: 4.0),

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    Icon(item['icon']),

                    const SizedBox(width: 10),

                    Text(
                      "${item['title']}: ",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(item['value'].toString()),

                    const Spacer(),

                    if (item['isEditable'] == true)
                      const Icon(Icons.edit, color: Colors.blue),
                  ],
                ),
              );
            }),

            OutlinedButton(
              onPressed: () {

                setState(() {

                  account.add({
                    'title': 'Account Type',
                    'value': 'Savings',
                    'icon': Icons.account_balance_rounded,
                    'isEditable': true,
                  });

                });

              },

              child: const Text('Refresh Details'),
            ),
          ],
        ),
      ),
    );
  }
}