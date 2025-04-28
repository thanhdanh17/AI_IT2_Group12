import 'package:flutter/material.dart';

class OtherIncomeCategoryScreen extends StatefulWidget {
  const OtherIncomeCategoryScreen({super.key});

  @override
  State<OtherIncomeCategoryScreen> createState() => _OtherIncomeCategoryScreenState();
}

class _OtherIncomeCategoryScreenState extends State<OtherIncomeCategoryScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitCategory() {
    final enteredCategory = _controller.text.trim();
    if (enteredCategory.isNotEmpty) {
      Navigator.pop(context, enteredCategory); // Trả dữ liệu về
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Income Category', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter custom income category',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submitCategory(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitCategory,
                child: const Text('Save Category'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
