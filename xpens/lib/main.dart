import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xpens/models/transaction_data.dart';
import 'package:xpens/screens/onboarding_screen.dart';
import 'package:xpens/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransactionData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Xpens',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(), // ✨ CHỈNH XÁC LÀ HomeScreen() ✨
      ),
    );
  }
}
