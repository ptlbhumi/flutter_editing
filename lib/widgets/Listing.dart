import 'package:flutter/material.dart';
import 'AddBookPage.dart';
import 'EditPage.dart';

void main() {
  runApp(const MyApp());
}

/// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Listing(),
    );
  }
}

/// MODEL CLASS
class BookData {

  String studentName;
  String bookName;
  DateTime dueDate;
  bool isReturned;

  BookData({
    required this.studentName,
    required this.bookName,
    required this.dueDate,
    this.isReturned = false,
  });
}

/// DATE FORMATTER
String formatDate(DateTime date) =>
    "${date.day}/"
    "${date.month}/"
    "${date.year}";

/// COMMON GAP
Widget gap([double h = 15]) =>
    SizedBox(height: h);

/// SAME DATE CHECKER
bool sameDate(
  DateTime a,
  DateTime b,
) {

  return a.day == b.day &&
      a.month == b.month &&
      a.year == b.year;
}

/// HOLIDAY CHECKER
bool isHoliday(
  DateTime date,
  List<DateTime> holidays,
) {

  return holidays.any(
    (holiday) =>
        sameDate(holiday, date),
  );
}

/// DATE BOX WIDGET
class DateBox extends StatelessWidget {

  final String date;
  final VoidCallback onTap;

  const DateBox({
    super.key,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment:
          Alignment.centerRight,

      child: GestureDetector(

        onTap: onTap,

        child: Card(

          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(
                    15),
          ),

          child: Padding(
            padding:
                const EdgeInsets.all(15),

            child: Column(
              children: [

                const Text(
                  "Date",

                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                Text(date),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// BOOK CARD
class BookCard extends StatelessWidget {

  final BookData book;
  final Function(bool?) onChanged;

  const BookCard({
    super.key,
    required this.book,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 4,

      margin: const EdgeInsets.only(
        bottom: 15,
      ),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: ListTile(

        contentPadding:
            const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 30,

          backgroundColor:
              Colors.indigo.shade100,

          child: const Icon(
            Icons.person,
            color: Colors.indigo,
          ),
        ),

        title: Text(
          book.studentName,

          style: const TextStyle(
            fontWeight:
                FontWeight.bold,
            fontSize: 18,
          ),
        ),

        subtitle: Padding(
          padding:
              const EdgeInsets.only(
            top: 8,
          ),

          child: Text(
            "Book: ${book.bookName}\n"
            "Due Date: ${formatDate(book.dueDate)}",

            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),

        /// RIGHT SIDE BUTTONS
        trailing: Row(
          mainAxisSize:
              MainAxisSize.min,

          children: [

            /// PENCIL ICON
            IconButton(

              icon: const Icon(
                Icons.edit,
                color: Colors.blue,
              ),

              /// NO ACTION
              onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => EditPage(
            book: book,
      ),
    ),
  );
},
            ),

            /// CHECKBOX
            Checkbox(
              value: book.isReturned,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}

/// MAIN PAGE
class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  State<Listing> createState() =>
      _ListingState();
}

class _ListingState
    extends State<Listing> {

  DateTime currentDate =
      DateTime.now();

  /// HOLIDAYS
  final holidays = [
    DateTime(2026, 5, 27),
  ];

  /// BOOK LIST
  final List<BookData> books = [

    BookData(
      studentName: "Rahul",
      bookName: "Flutter Basics",
      dueDate: DateTime(2026, 5, 19),
    ),

    BookData(
      studentName: "Priya",
      bookName: "Dart Programming",
      dueDate: DateTime(2026, 5, 19),
    ),

    BookData(
      studentName: "Aman",
      bookName: "Java",
      dueDate: DateTime(2026, 5, 20),
    ),
  ];

  /// FILTER BOOKS
  List<BookData> getFilteredBooks() {

    if (currentDate.weekday ==
            DateTime.sunday ||
        isHoliday(
          currentDate,
          holidays,
        )) {

      return [];
    }

    return books.where((book) {

      return sameDate(
        book.dueDate,
        currentDate,
      );

    }).toList();
  }

  /// PICK DATE
  Future<void> pickDate() async {

    final pickedDate =
        await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {

      setState(() {

        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final filteredBooks =
        getFilteredBooks();

    return Scaffold(

      backgroundColor:
          Colors.blue.shade50,

      appBar: AppBar(
        title: const Text(
          "Library Management",
        ),
        centerTitle: true,
      ),

      /// + BUTTON
      floatingActionButton:
          FloatingActionButton(

        child:
            const Icon(Icons.add),

        /// NO ACTION
        onPressed: () {
          // Navigate to AddBookPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddBookPage(),
            ),
          );
        },
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(15),

        child: Column(
          children: [

            /// DATE BOX
            DateBox(
              date:
                  formatDate(currentDate),
              onTap: pickDate,
            ),

            gap(),

            /// NO DATA
            if (filteredBooks
                .isEmpty)

              const Expanded(
                child: Center(
                  child: Text(
                    "No More Details",

                    style: TextStyle(
                      fontSize: 25,
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              )

            else

              /// BOOK LIST
              Expanded(
                child:
                    ListView.builder(

                  itemCount:
                      filteredBooks
                          .length,

                  itemBuilder:
                      (_, index) {

                    final book =
                        filteredBooks[
                            index];

                    return BookCard(

                      book: book,

                      onChanged:
                          (value) {

                        setState(() {

                          book.isReturned =
                              value!;
                        });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}