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
                        child: Row(
                          children: [
                            Container(
                              width: 100.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.amberAccent,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                //tx.amount.toString(),
                                '\$ ${tx.amount}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  tx.date.toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
