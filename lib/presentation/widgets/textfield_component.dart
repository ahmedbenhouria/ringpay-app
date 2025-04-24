import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  String hintText;
  bool? obscureText;
  TextEditingController controller;
  final Widget? child;

  TextFieldComponent({
    super.key,
    required this.hintText,
    this.obscureText,
    required this.controller,
    this.child,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        hintText: widget.hintText,
        suffixIcon: widget.child,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
