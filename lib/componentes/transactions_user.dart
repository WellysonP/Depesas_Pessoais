import 'dart:math';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:expenses/componentes/transactions_form.dart';
import 'package:expenses/componentes/transactions_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: "T1",
      title: "Novo Tênis de Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: "T2",
      title: "Conta de Luz",
      value: 211.30,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
