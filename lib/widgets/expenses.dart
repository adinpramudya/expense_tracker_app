import 'package:expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/new_expanses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpense = [
    Expense(
        title: "Flutter Course",
        amount: 200000,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Seafood",
        amount: 900000,
        date: DateTime.now(),
        category: Category.food)
  ];

  void _overlayBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpenses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _overlayBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(child: ExpensesList(expenses: _registredExpense))
        ],
      ),
    );
  }
}
