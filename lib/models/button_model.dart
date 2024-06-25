import 'package:flutter/material.dart';

class ButtonModel {
  ButtonModel({
    required this.onPressed,
    required this.child,
  });
  
  final void Function() onPressed;
  final Widget child;
}
