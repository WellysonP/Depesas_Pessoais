import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitFomr() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: ((_) => _submitFomr()),
              controller: titleControler,
              decoration: InputDecoration(
                labelText: "Título",
              ),
            ),
            TextField(
              onSubmitted: ((_) => _submitFomr()),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: valueControler,
              decoration: InputDecoration(
                labelText: "Valor R\$",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text("Nova Transação"),
                  textColor: Theme.of(context).colorScheme.primary,
                  onPressed: _submitFomr,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
