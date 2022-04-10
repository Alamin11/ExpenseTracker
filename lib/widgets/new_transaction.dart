import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //NewTransaction({Key? key, required this.newTransaction}) : super(key: key);
  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitTx(), //submitting from soft keyboard
              //onChanged: (value) => titleInput = value,
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTx(),
              // onChanged: (value) {
              //   amountInput = value;
              // },
              controller: amountController,
            ),
            TextButton(
              onPressed: submitTx,
              child: const Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
