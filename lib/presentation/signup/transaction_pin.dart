import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_pay/core/configs/assets/app_vectors.dart';
import 'package:ring_pay/presentation/signup/primary_currency.dart';

import '../../core/configs/theme/app_colors.dart';
import '../widgets/main_button_component.dart';

class TransactionPinScreen extends StatefulWidget {
  const TransactionPinScreen({super.key});

  @override
  State<TransactionPinScreen> createState() => _TransactionPinScreenState();
}

class _TransactionPinScreenState extends State<TransactionPinScreen> {
  String enteredPin = '';

  /// this widget will be use for each digit
  Widget numButton(int number) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (enteredPin.length < 4) {
              enteredPin += number.toString();
            }
          });
        },
        style: TextButton.styleFrom(overlayColor: AppColors.primary),
        child: Container(
          alignment: Alignment.center,
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            shape: BoxShape.circle,
          ),
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            const Center(
              child: Text(
                'Set Transaction Pin',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'This pin will be required whenever you\nwant to carry out a transaction, keep it safe.',
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            /// pin code area
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index < enteredPin.length
                            ? AppColors.primary
                            : Color(0xffD7D7D7),
                  ),
                );
              }),
            ),

            SizedBox(height: 30),

            /// digits
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(
                        3,
                        (index) => numButton(1 + 3 * i + index),
                      ).toList(),
                ),
              ),

            /// 0 digit with back remove
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(onPressed: null, child: SizedBox()),
                  numButton(0),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: AppColors.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        if (enteredPin.isNotEmpty) {
                          enteredPin = enteredPin.substring(
                            0,
                            enteredPin.length - 1,
                          );
                        }
                      });
                    },
                    child: SvgPicture.asset(
                      AppVectors.backRemove,
                      width: 22,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            MainButtonComponent(
              buttonText: "Set Pin",
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PrimaryCurrencyScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
