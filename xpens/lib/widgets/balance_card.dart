import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xpens/models/transaction_data.dart';

class BalanceCard extends StatelessWidget {
  final VoidCallback onIncomeTap;
  final VoidCallback onExpenseTap;

  const BalanceCard({super.key, required this.onIncomeTap, required this.onExpenseTap});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionData>(context).transactions;

    double totalIncome = 0;
    double totalExpense = 0;

    for (var tx in transactions) {
      if (tx.isIncome) {
        totalIncome += tx.amount;
      } else {
        totalExpense += tx.amount;
      }
    }

    final balance = totalIncome - totalExpense;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('My Balance', style: TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 8),
        Text(
          '${balance.toStringAsFixed(0)} ₫',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onIncomeTap,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_upward, color: Colors.blue),
                      const SizedBox(height: 4),
                      const Text('Income', style: TextStyle(color: Colors.blue)),
                      Text('+${totalIncome.toStringAsFixed(0)} ₫', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: onExpenseTap,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_downward, color: Colors.red),
                      const SizedBox(height: 4),
                      const Text('Expense', style: TextStyle(color: Colors.red)),
                      Text('-${totalExpense.toStringAsFixed(0)} ₫', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
