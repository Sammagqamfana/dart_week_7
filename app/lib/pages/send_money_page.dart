import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String? _selectedPayment;
  bool _isFavorite = false;
  bool _showSuccess = false;

  final List<String> _paymentMethods = [
    'Bank Transfer',
    'Mobile Money',
    'Card Payment',
  ];

  @override
  void dispose() {
    _recipientController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _sendMoney() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showSuccess = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _showSuccess = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Recipient Name
                  TextFormField(
                    controller: _recipientController,
                    decoration: InputDecoration(
                      labelText: 'Recipient Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter recipient name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Amount
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter amount';
                      }
                      final num? amount = num.tryParse(value);
                      if (amount == null || amount <= 0) {
                        return 'Enter valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Payment Method
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                      border: OutlineInputBorder(),
                    ),
                    initialValue: _selectedPayment,
                    items: _paymentMethods
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedPayment = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) return 'Select payment method';
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Favorite Switch
                  SwitchListTile(
                    title: Text('Mark as Favorite'),
                    value: _isFavorite,
                    onChanged: (val) {
                      setState(() {
                        _isFavorite = val;
                      });
                    },
                  ),
                  SizedBox(height: 16),

                  // Send Button
                  CustomButton(text: 'Send Money', onPressed: _sendMoney),

                  SizedBox(height: 24),

                  // Success Message
                  AnimatedOpacity(
                    opacity: _showSuccess ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Transaction Successful!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
