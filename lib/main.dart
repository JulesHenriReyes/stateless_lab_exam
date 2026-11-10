import 'package:flutter/material.dart';

import 'shopping_cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UM Campus Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F5F2),
        useMaterial3: true,
      ),
      home: const ShoppingCartPage(),
    );
  }
}
