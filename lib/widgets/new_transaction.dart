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

  void addTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(titleController.text, double.parse(amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => addTransaction(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              onSubmitted: (_) => addTransaction(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            TextButton(
                onPressed: addTransaction,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ))
          ],
        ),
      ),
    );
  }
}
