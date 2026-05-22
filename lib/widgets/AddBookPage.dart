import 'package:flutter/material.dart';
import 'fragmentholder.dart';
  class AddBookPage extends StatefulWidget {

  final Function(BookData) onAddBook;

  const AddBookPage({
    super.key,
    required this.onAddBook,
  });

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

                  onPressed: () async {
                    final pickedDate =
      await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2020),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {

    setState(() {

      selectedDate = pickedDate;

    });
  }
}
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
                onPressed: () async {
  if (nameController.text.isNotEmpty &&
      bookController.text.isNotEmpty) {
    BookData newBook = BookData(
      studentName:
          nameController.text,
      bookName:
          bookController.text,
      dueDate:
          selectedDate,
    );
    await widget.onAddBook(
      newBook,
    );
    Navigator.pop(context);
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