import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextFild extends StatelessWidget {
  final Function onSubmitted;
  final valueControler;
  final String label;
  final bool keyboardTypeNumber;

  AdaptativeTextFild({
    required this.label,
    required this.onSubmitted,
    required this.valueControler,
    required this.keyboardTypeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            onSubmitted: ((_) => onSubmitted),
            controller: valueControler,
            keyboardType: keyboardTypeNumber
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
          )
        : TextField(
            onSubmitted: ((_) => onSubmitted),
            keyboardType: keyboardTypeNumber
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            controller: valueControler,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
