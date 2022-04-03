import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              width: double.infinity,
              color: Colors.amberAccent,
              child: const Text('chart'),
            ),
          ),
          const SizedBox(
            width: double.minPositive,
            child: Card(
              color: Colors.blue,
              child: Text('List of transaction'),
            ),
          ),
        ],
      ),
    );
  }
}
