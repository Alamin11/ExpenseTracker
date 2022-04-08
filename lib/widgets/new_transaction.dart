import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //NewTransaction({Key? key, required this.newTransaction}) : super(key: key);
  final Function newTransaction;
  NewTransaction(this.newTransaction, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                //label: Text('Title'),
                labelText: 'Title',
              ),
              //onChanged: (value) => titleInput = value,
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                // print('titleInput = $titleInput');
                // print('amountInput = $amountInput');

                // print(titleController.text);
                // print(amountController.text);
                newTransaction(
                    titleController.text, double.parse(amountController.text));
              },
              child: const Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
