                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
import 'package:flutter/material.dart';
  class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() =>
      _AddBookPageState();
}

class _AddBookPageState
    extends State<AddBookPage> {

  final TextEditingController
      nameController =
      TextEditingController();

  final TextEditingController
      bookController =
      TextEditingController();

  DateTime selectedDate =
      DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Add New Entry",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            /// STUDENT NAME
            TextField(
              controller:
                  nameController,

              decoration:
                  const InputDecoration(
                labelText:
                    "Student Name",

                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            /// BOOK NAME
            TextField(
              controller:
                  bookController,

              decoration:
                  const InputDecoration(
                labelText:
                    "Book Name",

                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            /// DATE PICKER
            Row(
              children: [

                Expanded(
                  child: Text(
                    "Due Date: "
                    "${selectedDate.day}/"
                    "${selectedDate.month}/"
                    "${selectedDate.year}",

                    style:
                        const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                IconButton(

                  icon: const Icon(
                    Icons.calendar_month,
                  ),

                  onPressed:
                      () async {

                    final picked =
                        await showDatePicker(
                      context:
                          context,

                      initialDate:
                          selectedDate,

                      firstDate:
                          DateTime(2020),

                      lastDate:
                          DateTime(2100),
                    );

                    if (picked !=
                        null) {

                      setState(() {

                        selectedDate =
                            picked;
                      });
                    }
                  },
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            /// SAVE BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  if (nameController
                          .text
                          .isNotEmpty &&
                      bookController
                          .text
                          .isNotEmpty) {

                    Navigator.pop(
                      context,

                      {
                        "studentName":
                            nameController
                                .text,

                        "bookName":
                            bookController
                                .text,

                        "dueDate":
                            selectedDate,
                      },
                    );
                  }
                },

                child:
                    const Text(
                  "Save",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}