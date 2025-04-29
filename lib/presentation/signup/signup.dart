import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_pay/presentation/login/login.dart';
import 'package:ring_pay/presentation/widgets/phone_num_field.dart';
import 'package:ring_pay/presentation/widgets/main_button_component.dart';
import 'package:ring_pay/presentation/widgets/textfield_component.dart';
import '../../core/configs/assets/app_vectors.dart';
import '../../core/configs/scale_size.dart';
import '../../core/configs/theme/app_colors.dart';
import 'otp.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
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
                                      'It takes less than a minute to create an account. Already have an account? ',
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
                                                  (BuildContext context) =>
                                                      LogInScreen(),
                                            ),
                                          );
                                        },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          TextFieldComponent(
                            hintText: "First Name",
                            controller: firstNameController,
                          ),

                          SizedBox(height: 23),
                          TextFieldComponent(
                            hintText: "Last Name",
                            controller: firstNameController,
                          ),

                          SizedBox(height: 23),
                          TextFieldComponent(
                            hintText: "Email",
                            controller: emailController,
                          ),

                          SizedBox(height: 23),
                          phoneNumberTextField(context),

                          SizedBox(height: 8),
                          // Password TextField //
                          TextFieldComponent(
                            hintText: "Password",
                            controller: passwordController,
                            obscureText: _obscureText,
                            child: UnconstrainedBox(
                              child: GestureDetector(
                                onTap: _toggleObscureText,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 17,
                                  ),
                                  child: SvgPicture.asset(
                                    _obscureText
                                        ? AppVectors.eye
                                        : AppVectors.eyeOff,
                                    width: 21,
                                    height: 21,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 23),
                          MainButtonComponent(
                            buttonText: "Create Account",
                            callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (BuildContext context) => OtpScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
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
                                builder: (BuildContext context) => OtpScreen(),
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
            );
          },
        ),
      ),
    );
  }
}
