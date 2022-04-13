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
                  return Card(
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
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            //tx.amount.toString(),
                            '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
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
                              transactions[index].title,
                              style: const TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              // DateFormat('dd/MM/yy').format(tx.date),
                              //DateFormat.yMMMMEEEEd().format(tx.date),
                              DateFormat.yMEd()
                                  .format(transactions[index].date),
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
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
