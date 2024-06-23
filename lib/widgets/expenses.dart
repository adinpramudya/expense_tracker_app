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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpense.indexOf(expense);

    setState(() {
      _registredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense deleted."),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registredExpense.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expenses found. Start adding some!"),
    );
    if (_registredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registredExpense,
        onRemove: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _overlayBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [const Text("The Chart"), Expanded(child: mainContent)],
      ),
    );
  }
}
