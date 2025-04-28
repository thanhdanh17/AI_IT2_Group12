// lib/models/transaction_data.dart

import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionData extends ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  double get totalIncome {
    double income = 0;
    for (var tx in _transactions) {
      if (tx.isIncome) {
        income += tx.amount;
      }
    }
    return income;
  }

  double get totalExpense {
    double expense = 0;
    for (var tx in _transactions) {
      if (!tx.isIncome) {
        expense += tx.amount;
      }
    }
    return expense;
  }

  double get balance => totalIncome - totalExpense;
}
