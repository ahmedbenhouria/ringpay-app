import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ring_pay/presentation/signup/transaction_pin.dart';

import '../../core/configs/theme/app_colors.dart';
import '../widgets/main_button_component.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _otpBox(BuildContext context, int index) {
    return SizedBox(
      width: 45,
      height: 45,
      child: TextFormField(
        controller: _controllers[index],
        onChanged: (value) {
          setState(() {});
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              // Change color based on whether there's a value
              color:
                  _controllers[index].text.isNotEmpty
                      ? AppColors.primary
                      : AppColors.greyBackground,
              width: 1.3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              // Change color based on whether there's a value
              color:
                  _controllers[index].text.isNotEmpty
                      ? AppColors.primary
                      : AppColors.greyBackground,
              width: 1.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.primary, width: 1.3),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Your Email',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Check your email for OTP code',
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        6,
                        (index) => _otpBox(context, index),
                      ),
                    ),
                  ),
                ),
                MainButtonComponent(
                  buttonText: "Continue",
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (BuildContext context) => TransactionPinScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 32),
                Center(
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
