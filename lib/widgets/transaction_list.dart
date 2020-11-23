import 'package:Expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;
  TransactionList(this.userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: userTransactions.isEmpty
          ? Column(children: [
              Text(
                'No transactions added yet',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 25.0),
              Container(
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ])
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 5.0,
                    ),
                    elevation: 5.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            child: Text(
                                '\$${userTransactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat()
                            .add_yMMMd()
                            .format(userTransactions[index].date),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                        onPressed: (){
                          deleteTx(userTransactions[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
