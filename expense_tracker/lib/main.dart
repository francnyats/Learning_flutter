import 'package:flutter/material.dart';

import 'package:expense_tracker/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 3, 27, 57),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 27, 179, 187),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
