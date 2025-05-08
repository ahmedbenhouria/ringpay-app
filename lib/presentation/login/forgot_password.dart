import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ring_pay/presentation/widgets/main_button_widget.dart';
import 'package:ring_pay/presentation/widgets/textfield_widget.dart';

import '../../core/configs/theme/app_colors.dart';
import '../signup/transaction_pin.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.32,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Enter your account email to reset your password. Know your password? ',
                        style: TextStyle(
                          color: AppColors.greyText,
                          height: 1.4,
                          letterSpacing: 0.32,
                        ),
                      ),
                      TextSpan(
                        text: 'Log in here',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (BuildContext context) => LogInScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 23),
                TextFieldWidget(hintText: "Email", controller: emailController),

                SizedBox(height: 23),
                MainButtonWidget(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
