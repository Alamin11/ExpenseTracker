import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //NewTransaction({Key? key, required this.newTransaction}) : super(key: key);
  final Function addTx;
  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
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
