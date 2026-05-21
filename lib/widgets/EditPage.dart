import 'package:flutter/material.dart';
import 'Listing.dart';
import 'fragmentholder.dart';
/// EDIT PAGE
class EditPage extends StatefulWidget {

  final BookData book;

  const EditPage({
    super.key,
    required this.book,
  });

  @override
  State<EditPage> createState() =>
      _EditPageState();
}

class _EditPageState
    extends State<EditPage> {

  late TextEditingController
      nameController;

  late TextEditingController
      bookController;

  late DateTime selectedDate;

  @override
  void initState() {

    super.initState();

    /// OLD DATA
    nameController =
        TextEditingController(
      text: widget.book.studentName,
    );

    bookController =
        TextEditingController(
      text: widget.book.bookName,
    );

    selectedDate =
        widget.book.dueDate;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Update Details",
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
              height: 20,
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
              height: 20,
            ),

            /// DATE
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

                    DateTime? picked =
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

            /// UPDATE BUTTON
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  /// UPDATE VALUES
                  widget.book.studentName =
                      nameController.text;

                  widget.book.bookName =
                      bookController.text;

                  widget.book.dueDate =
                      selectedDate;

                  Navigator.pop(
                      context);
                },

                child: const Text(
                  "Update",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}