import 'package:flutter/material.dart';
import 'send_money_page.dart';

class FarmerHomePage extends StatelessWidget {
  const FarmerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, Farmer!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),

            // Button to go to Send Money page with smooth slide
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SendMoneyPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0); // slide from right
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween =
                          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }
}
