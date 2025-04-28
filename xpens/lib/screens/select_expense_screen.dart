import 'package:flutter/material.dart';

class SelectExpenseScreen extends StatefulWidget {
  const SelectExpenseScreen({super.key});

  @override
  State<SelectExpenseScreen> createState() => _SelectExpenseScreenState();
}

class _SelectExpenseScreenState extends State<SelectExpenseScreen> {
  final List<String> expenseCategories = [
    'Food & Drink',
    'Shopping',
    'Transportation',
    'Bills & Utilities',
    'Others',
  ];

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Expense', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: expenseCategories.length,
                itemBuilder: (context, index) {
                  final category = expenseCategories[index];
                  return ListTile(
                    leading: const Icon(Icons.trending_down, color: Colors.red),
                    title: Text(category),
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedCategory == null
                    ? null
                    : () {
                        Navigator.pop(context, selectedCategory);
                      },
                child: const Text('Add expense'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
