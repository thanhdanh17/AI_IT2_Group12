import 'package:flutter/material.dart';
import 'package:xpens/models/transaction.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.isIncome;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              size: 80,
              color: isIncome ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              '${isIncome ? '+' : '-'} ${transaction.amount.toStringAsFixed(0)} ₫',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isIncome ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.category, size: 24),
                const SizedBox(width: 10),
                const Text('Category: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(child: Text(transaction.category)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.date_range, size: 24),
                const SizedBox(width: 10),
                const Text('Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${transaction.date.day}/${transaction.date.month}/${transaction.date.year}'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 24),
                const SizedBox(width: 10),
                const Text('Type: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(isIncome ? 'Income' : 'Expense'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.vpn_key, size: 24),
                const SizedBox(width: 10),
                const Text('ID: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Expanded(
                  child: Text(
                    transaction.id,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
