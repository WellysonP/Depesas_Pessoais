import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  _submitFomr() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((picketDate) {
      if (picketDate == null) {
        return;
      } else
        setState(() {
          _selectedDate = picketDate;
        });
      print(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                onSubmitted: ((_) => _submitFomr()),
                controller: _titleControler,
                decoration: InputDecoration(
                  labelText: "Título",
                ),
              ),
              TextField(
                onSubmitted: ((_) => _submitFomr()),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _valueControler,
                decoration: InputDecoration(
                  labelText: "Valor R\$",
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "Nenhuma data selecionada"
                            : "Data Selecionada: ${DateFormat("dd/MM/y").format(_selectedDate!)}",
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).colorScheme.primary,
                      onPressed: _showDatePicker,
                      child: Text(
                        "Selecionar Data",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Theme.of(context).colorScheme.primary,
                    child: Text(
                      "Nova Transação",
                      style: Theme.of(context).textTheme.button,
                    ),
                    onPressed: _submitFomr,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
