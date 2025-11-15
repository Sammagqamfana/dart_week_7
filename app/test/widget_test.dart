import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:send_money_app/main.dart'; // Make sure this matches your pubspec.yaml name

void main() {
  testWidgets('SendMoneyPage shows title and input fields', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(MyApp());

    // Wait for animations/frame
    await tester.pumpAndSettle();

    // Navigate to Send Money page if needed
    final sendMoneyButton = find.text('Send Money'); // button on home page
    expect(sendMoneyButton, findsOneWidget);

    // Tap the button to go to Send Money page
    await tester.tap(sendMoneyButton);
    await tester.pumpAndSettle();

    // Verify Send Money page title exists
    expect(find.text('Send Money'), findsWidgets);

    // Verify form fields exist
    expect(find.byType(TextFormField), findsNWidgets(2)); // recipient name & amount
    expect(find.byType(DropdownButton<String>), findsOneWidget); // payment method
    expect(find.byType(Switch), findsOneWidget); // favorite switch

    // Optionally: verify the Send button exists
    expect(find.text('Send Money Now'), findsOneWidget);
  });
}
