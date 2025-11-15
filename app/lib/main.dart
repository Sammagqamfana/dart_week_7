import 'package:flutter/material.dart';
import 'pages/send_money_page.dart'; // import the new page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famai App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SendMoneyPage(),
    );
  }
}
