import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_textfild.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _submitFomr() {
    final title = _titleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
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
              AdaptativeTextFild(
                label: "Título",
                onSubmitted: (_) => _submitFomr(),
                valueControler: _titleControler,
              ),
              AdaptativeTextFild(
                label: "Valor R\$",
                onSubmitted: (_) => _submitFomr(),
                valueControler: _valueControler,
                keyboardType: TextInputType.numberWithOptions(),
              ),
              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: "Nova Transação",
                    onPressed: _submitFomr,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
