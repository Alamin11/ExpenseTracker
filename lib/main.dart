import 'package:expense_tracker/widgets/user_transaction.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  //Declaring two properties for the textField input
  // String? titleInput;
  // String? amountInput;

  //Controller properties
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                color: Colors.amberAccent,
                child: const Text('chart'),
              ),
            ),
            const UserTransaction(),
          ],
        ),
      ),
    );
  }
}
