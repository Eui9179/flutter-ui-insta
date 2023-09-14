import 'package:flutter/material.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;
  const StockDetailScreen(this.stockName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName),
        centerTitle: false,
      ),
      body: const Placeholder(),
    );
  }
}
