import 'package:expense_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import './widgets/new_transaction.dart';
import '../models/transaction.dart';
import './widgets/transaction_list.dart';

void main(List<String> args) {
  ///Forcing the device to only render in portrait mode
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

String titleText = 'Expense Tracker';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titleText,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //colorScheme: ColorScheme.fromSwatch(),
        fontFamily: 'LobsterTwo',
        textTheme: const TextTheme(
          headline4: TextStyle(
            //fontFamily: 'LobsterTwo',
            // fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          // headline6: TextStyle(
          //     //fontFamily: 'LobsterTwo',
          //     //fontSize: 20.0,
          //     //fontWeight: FontWeight.bold,
          //     ),
          subtitle2: TextStyle(
            //fontFamily: 'LobsterTwo',
            // fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final titleController = TextEditingController();
  // final amountController = TextEditingController();
  List<Transaction> get _recentTransaction {
    return _userTransactions
        .where(
          (tx) => tx.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  final List<Transaction> _userTransactions = [
    /*Transaction(
      id: 't1',
      title: 'Egg',
      amount: 72,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Dart',
      amount: 200.50,
      date: DateTime.now(),
    ),*/
  ];
  bool showChart = false;

  void _addNewTransaction(String title, double amount, DateTime choosenDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: choosenDate,
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final myAppBar = AppBar(
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final txListWidget = SizedBox(
      height: (MediaQuery.of(context).size.height -
              myAppBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          .7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    return Scaffold(
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (isLandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show chart'),
                  Switch(
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandScape)
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        myAppBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    .3,
                child: Chart(_recentTransaction),
              ),
            if (!isLandScape) txListWidget,
            if (isLandScape)
              showChart
                  ? SizedBox(
                      height: (MediaQuery.of(context).size.height -
                              myAppBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          .7,
                      child: Chart(_recentTransaction),
                    )
                  : txListWidget,
          ],
        ),
      ),
      //floatingActionButton: Icon(Icons.add),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
