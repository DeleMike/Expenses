import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle , enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                    // onChanged: (val)=> titleInput = val,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount',
                    ),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    onSubmitted: (_) => submitData(),
                    // onChanged: (val)=> amountInput = val,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                      child: Text(
                        'Add transaction',
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                      onPressed: submitData,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}