import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../main.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: () => onPressed(),
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : RaisedButton(
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              label,
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () => onPressed,
          );
  }
}
