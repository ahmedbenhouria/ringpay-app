import 'package:flutter/material.dart';

import '../../core/configs/scale_size.dart';

class MainButtonComponent extends StatelessWidget {
  String buttonText;
  VoidCallback callback;

  MainButtonComponent({
    super.key,
    required this.buttonText,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 17),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
      ),
    );
  }
}
