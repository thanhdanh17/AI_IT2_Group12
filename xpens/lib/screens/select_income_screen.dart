import 'package:flutter/material.dart';
import 'package:xpens/screens/other_income_category_screen.dart'; // ✅ Import thêm màn khác

class SelectIncomeScreen extends StatelessWidget {
  const SelectIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> incomeCategories = [
      'Salary',
      'Business',
      'Gifts',
      'Others', // ✅ Vẫn có Others
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Income', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.trending_up, color: Colors.blue),
            title: Text(incomeCategories[index]),
            onTap: () async {
              if (incomeCategories[index] == 'Others') {
                // 👉 Nếu chọn Others thì mở màn hình nhập tùy chỉnh
                final otherCategory = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OtherIncomeCategoryScreen()),
                );

                if (otherCategory != null && otherCategory is String) {
                  Navigator.pop(context, otherCategory); // Gửi dữ liệu về AddIncomeScreen
                }
              } else {
                Navigator.pop(context, incomeCategories[index]);
              }
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: incomeCategories.length,
      ),
    );
  }
}
