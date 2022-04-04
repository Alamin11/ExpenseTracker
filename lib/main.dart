import 'package:flutter/material.dart';
import './transaction.dart';

void main(List<String> args) {
  runApp(MyApp());
}

String titleText = 'Expense Tracker';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleText,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Egg',
      amount: 72,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Dart',
      amount: 200.50,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: Container(
              width: double.infinity,
              color: Colors.amberAccent,
              child: const Text('chart'),
            ),
          ),
          Column(
              children: transactions
                  .map((tx) => Card(
                        child: Text(tx.id),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
