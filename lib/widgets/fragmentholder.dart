import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/MyWidget.dart';
import 'package:flutter_application_1/widgets/MyWidgetWithState.dart';
import 'package:flutter_application_1/widgets/Myname.dart';
import 'package:flutter_application_1/widgets/FetchData.dart';
import 'package:flutter_application_1/widgets/Listing.dart';
import 'package:flutter_application_1/widgets/AddBookPage.dart';
import 'package:flutter_application_1/widgets/EditPage.dart';

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


class FragmentHolder extends StatefulWidget {
  final Widget child;

  const FragmentHolder({super.key, required this.child});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {

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

    /// 20 MAY
    BookData(
      studentName: "Aman",
      bookName: "Java",
      dueDate: DateTime(2026, 5, 20),
    ),

    /// 21 MAY
    BookData(
      studentName: "Sneha",
      bookName: "Python",
      dueDate: DateTime(2026, 5, 21),
    ),

    BookData(
      studentName: "Karan",
      bookName: "C Programming",
      dueDate: DateTime(2026, 5, 21),
    ),

    BookData(
      studentName: "Neha",
      bookName: "DBMS",
      dueDate: DateTime(2026, 5, 21),
    ),

    /// 22 MAY
    BookData(
      studentName: "Rohit",
      bookName: "Machine Learning",
      dueDate: DateTime(2026, 5, 22),
    ),

    BookData(
      studentName: "Anjali",
      bookName: "Operating System",
      dueDate: DateTime(2026, 5, 22),
    ),

    BookData(
      studentName: "Jay",
      bookName: "AI Fundamentals",
      dueDate: DateTime(2026, 5, 22),
    ),

    BookData(
      studentName: "Pooja",
      bookName: "Cyber Security",
      dueDate: DateTime(2026, 5, 22),
    ),

    /// 23 MAY
    BookData(
      studentName: "Vikas",
      bookName: "Cloud Computing",
      dueDate: DateTime(2026, 5, 23),
    ),

    /// 24 MAY = SUNDAY (NO DATA)

    /// 25 MAY
    BookData(
      studentName: "Meera",
      bookName: "Computer Networks",
      dueDate: DateTime(2026, 5, 25),
    ),

    BookData(
      studentName: "Arjun",
      bookName: "Data Structures",
      dueDate: DateTime(2026, 5, 25),
    ),

    /// 26 MAY
    BookData(
      studentName: "Riya",
      bookName: "Software Engineering",
      dueDate: DateTime(2026, 5, 26),
    ),

    BookData(
      studentName: "Dev",
      bookName: "React Native",
      dueDate: DateTime(2026, 5, 26),
    ),

    BookData(
      studentName: "Tina",
      bookName: "PHP",
      dueDate: DateTime(2026, 5, 26),
    ),

    /// 27 MAY HOLIDAY (NO DATA)

    /// 28 MAY
    BookData(
      studentName: "Yash",
      bookName: "Laravel",
      dueDate: DateTime(2026, 5, 28),
    ),

    /// 29 MAY
    BookData(
      studentName: "Krupa",
      bookName: "Android Development",
      dueDate: DateTime(2026, 5, 29),
    ),

    BookData(
      studentName: "Harsh",
      bookName: "iOS Development",
      dueDate: DateTime(2026, 5, 29),
    ),

    BookData(
      studentName: "Nidhi",
      bookName: "Data Science",
      dueDate: DateTime(2026, 5, 29),
    ),

    /// 30 MAY
    BookData(
      studentName: "Parth",
      bookName: "Networking",
      dueDate: DateTime(2026, 5, 30),
    ),

    BookData(
      studentName: "Komal",
      bookName: "UI/UX Design",
      dueDate: DateTime(2026, 5, 30),
    ),

    /// 31 MAY = SUNDAY (NO DATA)
  ];
  

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyName(name: "Never Miss your book Return date"),
          Expanded(child: Navigator(
            initialRoute: '/',
            onGenerateRoute:(RouteSettings settings){
              WidgetBuilder builder;

              switch(settings.name){
                case '/':
                  builder = (BuildContext context) => Listing(
                       books: books,
                      );
                  break;
                case '/AddBook':
                  builder = (BuildContext context) => const AddBookPage();
                  break;
                case '/EditBook':
                  builder = (BuildContext context) => EditPage(
                  book: BookData(
                   studentName: "",
                   bookName: "",
                   dueDate: DateTime.now(),
            ),
    );
                default:
                builder = (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("Route not found"),
                  ),
                );
              }
              return MaterialPageRoute(builder: builder, settings: settings);
            },
          )),
        ],
      )
    );
  }
}