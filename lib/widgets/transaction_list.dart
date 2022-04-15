import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 340,
        child: transactions.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'No transaction added yet',
                    style: TextStyle(
                      //fontFamily: 'RobotoCondensed',
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/transparentWaiting.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                      radius: 30.0,
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    trailing: Icon(Icons.delete),
                  );
                },
                itemCount: transactions.length,
                // children: transactions
                //     .map(
                //       (tx) =>
                //     )
                //     .toList()),
              ));
  }
}
