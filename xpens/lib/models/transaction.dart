class Transaction {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final bool isIncome; // true nếu là Thu nhập, false nếu là Chi tiêu

  Transaction({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.isIncome,
  });
}
