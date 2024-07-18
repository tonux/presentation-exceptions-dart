import 'package:flutter/material.dart';
import 'wallet.dart';

void main() {
  runApp(WalletApp());
}

class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WalletPage(),
    );
  }
}

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final Wallet _wallet = Wallet(100.0); // Initial balance
  final TextEditingController _amountController = TextEditingController();
  String _message = '';

  void _deposit() {
    try {
      final amount = double.parse(_amountController.text);
      _wallet.deposit(amount);
      setState(() {
        _message = 'Deposited \$${amount.toStringAsFixed(2)} successfully!';
      });
    } catch (e) {
      setState(() {
        _message = 'Error: ${e.toString()}';
      });
    }
  }

  void _withdraw() {
    try {
      final amount = double.parse(_amountController.text);
      _wallet.withdraw(amount);
      setState(() {
        _message = 'Withdrew \$${amount.toStringAsFixed(2)} successfully!';
      });
    } catch (e) {
      setState(() {
        _message = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Balance: \$${_wallet.balance.toStringAsFixed(2)}'),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _deposit,
                  child: const Text('Deposit'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _withdraw,
                  child: const Text('Withdraw'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _message.contains('successfully')
                ? Text(_message, style: const TextStyle(color: Colors.green))
                : Text(_message, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
