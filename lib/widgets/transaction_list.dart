import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * .6,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 24.0,
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
                      height: constraints.maxHeight * .6,
                      child: Image.asset(
                        'assets/images/transparentWaiting.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              })
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
                    trailing: MediaQuery.of(context).size.width > 300
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
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
