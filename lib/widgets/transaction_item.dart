import 'package:Expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
                child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat().add_yMMMd().format(transaction.date),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          trailing: MediaQuery.of(context).size.width > 500
              ? FlatButton.icon(
                  icon: Icon(
                    Icons.delete,
                  ),
                  label: Text(
                    'Delete',
                  ),
                  textColor: Theme.of(context).errorColor,
                  onPressed: () => deleteTx(transaction.id))
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () => deleteTx(transaction.id),
                ),
        ),
      ),
    );
  }
}
