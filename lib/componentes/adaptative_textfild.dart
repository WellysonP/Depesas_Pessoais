import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextFild extends StatelessWidget {
  final Function(String) onSubmitted;
  final TextEditingController valueControler;
  final String label;
  final TextInputType keyboardType;

  const AdaptativeTextFild({
    required this.label,
    required this.onSubmitted,
    required this.valueControler,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              placeholder: label,
              onSubmitted: onSubmitted,
              controller: valueControler,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            decoration: InputDecoration(
              labelText: label,
            ),
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            controller: valueControler,
          );
  }
}
