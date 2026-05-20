import 'package:flutter/material.dart';
import 'package:flutter_application_1/splashscreen.dart';
import 'package:flutter_application_1/widgets/MyWidget.dart';
import 'package:flutter_application_1/widgets/MyWidgetWithState.dart';
import 'package:flutter_application_1/widgets/Myname.dart';
import 'package:flutter_application_1/widgets/Screen1.dart';
import 'package:flutter_application_1/widgets/FetchData.dart';
import 'package:flutter_application_1/widgets/Screen2.dart';
import 'package:flutter_application_1/widgets/Screen3.dart';

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

    BookData(
      studentName: "Rohit",
      bookName: "Machine Learning",
      dueDate: DateTime(2026, 5, 22),
    ),
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
                  builder = (BuildContext context) => const Screen1();
                  break;
                case '/Screen2':
                  builder = (BuildContext context) => const Screen2();
                  break;
                case '/Screen3':
                  builder = (BuildContext context) => const Screen3();
                  break;
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