import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_pay/core/configs/assets/app_vectors.dart';
import 'package:ring_pay/presentation/widgets/credit_card_component.dart';
import '../../core/configs/scale_size.dart';
import '../../core/configs/theme/app_colors.dart';
import '../widgets/transaction_card_component.dart';

class CardDetailsScreen extends StatelessWidget {
  final String tag;

  const CardDetailsScreen({super.key, required this.tag});

  Widget _rowItem(String label, String value, VoidCallback callback) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppColors.greyText,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff404040),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: InkWell(
            onTap: callback,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffEDF8FE),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.5),
                child: SvgPicture.asset(AppVectors.copyDetails),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _detailsBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black87.withOpacity(0.5),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.line),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 30,
                  ),
                  child: Column(
                    spacing: 25,
                    children: [
                      _rowItem('Card Name', 'John Doe', () {}),
                      _rowItem('Number', '5678 8987 7654 8987', () {}),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 55,
                        children: [
                          Expanded(
                            child: Center(child: _rowItem('CCV', '098', () {})),
                          ),
                          Expanded(
                            child: Center(
                              child: _rowItem('Expiry', '07/27', () {}),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 55,
                        children: [
                          Expanded(
                            child: Center(
                              child: _rowItem('Pin', '----', () {}),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: _rowItem('Zip Code', '101212', () {}),
                            ),
                          ),
                        ],
                      ),
                      _rowItem(
                        'Billing Address',
                        '25 philips street, new jersey',
                        () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _customIconButton(String iconPath, VoidCallback onPressed) {
    return Container(
      width: 49,
      height: 49,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2.5,
            blurRadius: 8,
            offset: const Offset(6, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(iconPath, width: 21, height: 21),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Card Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Hero(
                  tag: tag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: CreditCardComponent(),
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Center(child: SvgPicture.asset(AppVectors.layerBlur)),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _customIconButton(AppVectors.details, () {
                            _detailsBottomSheet(context);
                          }),
                          const SizedBox(width: 25),
                          _customIconButton(AppVectors.plus, () {}),
                          const SizedBox(width: 25),
                          _customIconButton(AppVectors.freeze, () {}),
                          const SizedBox(width: 25),
                          _customIconButton(AppVectors.more, () {}),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SvgPicture.asset(AppVectors.calendar),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  spacing: 11,
                  children: [
                    TransactionCardComponent(
                      transactionLabel: 'Payroll',
                      transactionAmount: '\$7,200',
                      amountTextColor: AppColors.red,
                      timestamp: '2min ago',
                      iconPath: AppVectors.person,
                      bgColor: const Color(0xffD9D8F7),
                    ),
                    TransactionCardComponent(
                      transactionLabel: 'Payroll',
                      transactionAmount: '\$7,200',
                      amountTextColor: AppColors.red,
                      timestamp: '4min ago',
                      iconPath: AppVectors.person,
                      bgColor: const Color(0xffD9D8F7),
                    ),
                    TransactionCardComponent(
                      transactionLabel: 'Expenses',
                      transactionAmount: '\$910',
                      amountTextColor: AppColors.red,
                      timestamp: '10min ago',
                      iconPath: AppVectors.bankNotes,
                      bgColor: const Color(0xffF9EEBA),
                    ),
                    TransactionCardComponent(
                      transactionLabel: 'Fund Wallet',
                      transactionAmount: '\$310',
                      amountTextColor: AppColors.primary,
                      timestamp: '10min ago',
                      iconPath: AppVectors.bankNotes,
                      bgColor: const Color(0xffF9EEBA),
                    ),
                    TransactionCardComponent(
                      transactionLabel: 'Receive Fund',
                      transactionAmount: '\$350',
                      amountTextColor: AppColors.primary,
                      timestamp: '10min ago',
                      iconPath: AppVectors.bankNotes,
                      bgColor: const Color(0xffF9EEBA),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
