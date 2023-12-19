import 'package:flutter/material.dart';
import 'package:mobile_dev_test_task/constants.dart';
import 'package:mobile_dev_test_task/form_page.dart';

void main() {
  runApp(const TestTask());
}

class TestTask extends StatelessWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test task',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              fontFamily: TYPOLD_REGULAR,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: 24,
            )),
        inputDecorationTheme: const InputDecorationTheme(
            border: UnderlineInputBorder(),
            labelStyle: TextStyle(
                color: Color.fromARGB(255, 131, 136, 152), fontSize: 14)),
      ),
      home: const TestTaskScreen(title: APPBAR_TITLE),
    );
  }
}
