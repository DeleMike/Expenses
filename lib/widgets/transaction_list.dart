import 'package:Expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:400.0,
      child: userTransactions.isEmpty ? Column(children: [
          Text('No transactions added yet', style: Theme.of(context).textTheme.bodyText2,),
          SizedBox(height: 25.0),
          Container(height:200.0, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
      ]): ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (ctx, index) {
          return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
                ),
                child: Text(
                  '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat().add_yMMMd().format(userTransactions[index].date),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        },
        
      ),
    );
  }
}
