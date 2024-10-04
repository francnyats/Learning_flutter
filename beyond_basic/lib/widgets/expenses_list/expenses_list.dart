import 'package:beyond_basic/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:beyond_basic/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },

        ///alows flutter to uniquely identify a widget
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
