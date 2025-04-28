import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Budget', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Spacer(),
            Text('Add budget', style: TextStyle(color: Colors.blue)),
            Icon(Icons.add, color: Colors.blue),
          ],
        ),
        SizedBox(height: 12),
        ListTile(
          leading: Icon(Icons.fastfood, color: Colors.blue),
          title: Text('Food & Drink'),
          subtitle: Text('01.04.2025 - 30.04.2025'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('0 đ / 2.000.000 đ'),
              SizedBox(height: 4),
              Container(
                width: 100,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.32,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
