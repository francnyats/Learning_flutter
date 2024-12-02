import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense-model.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key}); //constructor function of the class

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

// 2nd class is a state class.
// Stateful widgets need two classes: widget and state class
//tell flutter to which widget the state
//will be connected

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category1.work),
    Expense(
      title: 'Cinema',
      amount: 19.99,
      date: DateTime.now(),
      category: Category1.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
