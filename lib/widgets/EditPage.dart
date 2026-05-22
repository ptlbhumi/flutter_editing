import 'package:flutter/material.dart';
import 'Listing.dart';
import 'fragmentholder.dart';
/// EDIT PAGE
class EditPage extends StatefulWidget {

  final BookData book;
  final Function(BookData) onEditBook;
  const EditPage({
    super.key,
    required this.book,
    required this.onEditBook, 
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

          child: SingleChildScrollView(
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

                  onPressed: () async {
  BookData updatedBook =
      BookData(
    studentName:
        nameController.text,
    bookName:
        bookController.text,
    dueDate:
        selectedDate,
    isReturned:
    widget.book.isReturned,
  );
  await widget.onEditBook(
    updatedBook,
  );
  Navigator.pop(context);
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

                onPressed: () async {
  BookData updatedBook =
      BookData(
    studentName:
        nameController.text,
    bookName:
        bookController.text,
    dueDate:
        selectedDate,
    isReturned:
      widget.book.isReturned,
  );
  await widget.onEditBook(
    updatedBook,
  );
  Navigator.pop(
    context,
    true,
  );
},

                child: const Text(
                  "Update",
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