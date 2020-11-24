import 'package:Expense/models/transaction.dart';
import 'package:Expense/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionList(this.userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(height: 25.0),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: userTransactions[index], deleteTx: deleteTx);
            },
          );
  }
}

