import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Nenhuma Transação cadastrada!",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 50),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            "R\$${tr.value.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat("EEEE, d 'de' MMMM 'de' y", "pt_BR")
                          .format(tr.date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
