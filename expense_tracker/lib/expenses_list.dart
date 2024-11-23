import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense-model.dart';
import 'package:expense_tracker/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    /// when anticipating a very long list dont use a column, use...
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    ); //create list for item only when visible
  }
}
