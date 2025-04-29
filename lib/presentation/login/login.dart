import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ring_pay/presentation/main_scaffold/main_scaffold.dart';
import 'package:ring_pay/presentation/login/forgot_password.dart';
import 'package:ring_pay/presentation/signup/signup.dart';

import '../../core/configs/assets/app_vectors.dart';
import '../../core/configs/scale_size.dart';
import '../../core/configs/theme/app_colors.dart';
import '../widgets/main_button_component.dart';
import '../widgets/textfield_component.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log in',
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
                            'You are welcome back. You don’t have an account? ',
                        style: TextStyle(
                          color: AppColors.greyText,
                          height: 1.4,
                          letterSpacing: 0.32,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign up here',
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
                                        (BuildContext context) =>
                                            SignUpScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23),
                TextFieldComponent(
                  hintText: "Email",
                  controller: emailController,
                ),
                // Password TextField //
                SizedBox(height: 23),
                // Password TextField //
                TextFieldComponent(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: _obscureText,
                  child: UnconstrainedBox(
                    child: GestureDetector(
                      onTap: _toggleObscureText,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: SvgPicture.asset(
                          _obscureText ? AppVectors.eye : AppVectors.eyeOff,
                          width: 21,
                          height: 21,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff25B14F),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),

                SizedBox(height: 23),
                MainButtonComponent(
                  buttonText: "Log In",
                  callback: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MainScaffold(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(child: Divider(color: Color(0xffD7D7D7))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xffD7D7D7))),
                        ],
                      ),
                      SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: SvgPicture.asset(
                            AppVectors.google,
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) => LogInScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                          label: Text(
                            'Continue With Google',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context),
                            ),
                          ),
                        ),
                      ),
                    ],
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
