import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final bool? obscureText;
  final TextEditingController controller;
  final Widget? child;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.obscureText,
    required this.controller,
    this.child,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
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
