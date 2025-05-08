import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ring_pay/core/configs/assets/app_images.dart';
import 'package:ring_pay/core/configs/theme/app_colors.dart';
import 'package:ring_pay/presentation/widgets/main_button_widget.dart';
import '../../core/configs/utils/scale_size.dart';
import '../login/login.dart';
import '../signup/signup.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.blackBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.bgOnboarding, fit: BoxFit.contain),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'One App To\nRule Them All',
                      style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      ),
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      'All In One Financial Services For\nSME’s & Freelancers',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    MainButtonWidget(
                      buttonText: "Create Account",
                      callback: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignUpScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start,
                          textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) => LogInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
