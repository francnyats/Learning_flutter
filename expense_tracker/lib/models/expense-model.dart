import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category1 {
  //combination of predefined allowed values
  food,
  travel,
  leisure,
  work
}

const categoryIcons = {
  Category1.food: Icons.lunch_dining,
  Category1.travel: Icons.flight_takeoff,
  Category1.leisure: Icons.movie,
  Category1.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      //add an initializer list, used to initialize class properties
      // NOT received as constructor function arguments
      //eg ID
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category1 category;

  String get formattedDate {
    return formatter.format(date);
  }
}
