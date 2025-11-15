import 'dart:developer' as developer;

class FarmerService {
  // Example function
  Future<void> sendMoney(String recipient, double amount, String method) async {
    // pretend to call backend
    await Future.delayed(Duration(seconds: 2));
    developer.log('Sent $amount to $recipient via $method');
  }
}
