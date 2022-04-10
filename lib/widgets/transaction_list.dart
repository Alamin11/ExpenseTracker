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
        child: ListView.builder(
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
                        color: Colors.amberAccent,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      //tx.amount.toString(),
                      '\$ ${transactions[index].amount.toStringAsFixed(2)}',
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
                        transactions[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        // DateFormat('dd/MM/yy').format(tx.date),
                        //DateFormat.yMMMMEEEEd().format(tx.date),
                        DateFormat.yMEd().format(transactions[index].date),
                        style: const TextStyle(
                          fontSize: 15.0,
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
