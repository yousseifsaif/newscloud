import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Currency {
  final String name;
  final String code;
  final double rate;

  Currency({required this.name, required this.code, required this.rate});
}

final List<Currency> currencies = [
  Currency(name: 'US Dollar', code: 'USD', rate: 1.0),
  Currency(name: 'EGP', code: 'EGP', rate: 49.98),
  Currency(name: 'Japanese Yen', code: 'JPY', rate: 110.0),
  Currency(name: 'British Pound', code: 'GBP', rate: 0.8),
  Currency(name: 'Indian Rupee', code: 'INR', rate: 73.0),
];



class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currencies'),
      ),
      body: ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(currency.code),
            ),
            title: Text(currency.name),
            subtitle: Text('Exchange Rate: ${currency.rate.toStringAsFixed(2)}'),
          );
        },
      ),
      
    );
  }
}
Future<List<Currency>> fetchCurrencies() async {
  final response = await http.get(Uri.parse('https://api.exchangerate-api.com/v4/latest/USD'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final rates = data['rates'] as Map<String, dynamic>;

    return rates.entries.map((entry) {
      return Currency(name: entry.key, code: entry.key, rate: entry.value.toDouble());
    }).toList();
  } else {
    throw Exception('Failed to load exchange rates');
  }
}
