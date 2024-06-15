import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(expense.title),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Rp ${expense.formattedAmount}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      Text(expense.formattedDate)
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
