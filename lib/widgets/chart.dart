import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalAmount = 0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalAmount += recentTransaction[i].amount;
        }
      }
      print(totalAmount);
      print(DateFormat.E().format(weekDay));
      return {'day': DateFormat.E().format(weekDay), 'amount': totalAmount};
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, element) => sum + (element['amount'] as num));
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: e['day'].toString(),
                spendingAmount: (e['amount'] as double),
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
