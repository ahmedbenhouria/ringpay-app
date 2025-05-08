import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ring_pay/core/configs/assets/app_images.dart';
import 'package:ring_pay/core/configs/theme/app_colors.dart';
import '../../core/configs/assets/app_vectors.dart';
import '../widgets/transaction_card_widget.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  Widget _actionCard(
    Color bgColor,
    Color iconColor,
    String iconPath,
    String title,
    String desc,
  ) {
    return Container(
      width: 165,
      height: 172,
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 11.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 8,
            offset: const Offset(6, 4), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff404040),
              ),
            ),
            const SizedBox(height: 1),
            Text(
              desc,
              style: TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
                color: AppColors.greyText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.noise),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Header container with balance info
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.noise),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.primary,
                ),
                child: Stack(
                  children: [
                    // Background circles
                    Positioned(
                      top: 45,
                      left: 0,
                      child: SvgPicture.asset(AppVectors.circlesBg),
                    ),

                    // Main content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 83,
                                height: 38,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.white,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.asset(
                                          AppImages.usFlag,
                                          width: 25,
                                          height: 25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'USD',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff404040),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 142,
                                height: 29,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Primary Account',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff404040),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Primary Balance',
                                      style: TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    SvgPicture.asset(
                                      AppVectors.eye,
                                      width: 15,
                                      height: 15,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ],
                                ),
                                const AutoSizeText(
                                  '\$30,050.56',
                                  style: TextStyle(
                                    fontSize: 38,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Spacer to account for the overlapping cards
              SizedBox(height: MediaQuery.of(context).size.height * 0.156),

              // Transactions section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            TransactionCardWidget(
                              transactionLabel: 'Transferred Fund',
                              transactionAmount: '\$7,200',
                              amountTextColor: AppColors.red,
                              timestamp: '2min ago',
                              iconPath: AppVectors.person,
                              bgColor: const Color(0xffD9D8F7),
                            ),
                            SizedBox(height: 10),
                            TransactionCardWidget(
                              transactionLabel: 'Received Fund',
                              transactionAmount: '\$350',
                              amountTextColor: AppColors.primary,
                              timestamp: '10min ago',
                              iconPath: AppVectors.bankNotes,
                              bgColor: const Color(0xffF9EEBA),
                            ),
                            SizedBox(height: 10),
                            TransactionCardWidget(
                              transactionLabel: 'Facebook Ads',
                              transactionAmount: '\$910',
                              amountTextColor: AppColors.red,
                              timestamp: '10min ago',
                              iconPath: AppVectors.bankNotes,
                              bgColor: const Color(0xffF9EEBA),
                            ),
                            SizedBox(height: 10),
                            TransactionCardWidget(
                              transactionLabel: 'Add Fund',
                              transactionAmount: '\$350',
                              amountTextColor: AppColors.red,
                              timestamp: '15min ago',
                              iconPath: AppVectors.bankNotes,
                              bgColor: const Color(0xffF9EEBA),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Overlapping action cards with improved scrolling
          Positioned(
            top: 155,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 195,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                physics: const BouncingScrollPhysics(),
                children: [
                  _actionCard(
                    const Color(0xffEDF8FE),
                    const Color(0xff4CB4F6),
                    AppVectors.arrowUpRight,
                    'Transfer',
                    'Send or withdraw your money',
                  ),
                  _actionCard(
                    const Color(0xffECF8EC),
                    AppColors.primary,
                    AppVectors.plus,
                    'Add Money',
                    'Receive or fund account',
                  ),
                  _actionCard(
                    const Color(0xffFDF9E9),
                    const Color(0xffECC722),
                    AppVectors.details,
                    'Details',
                    'View account details',
                  ),
                  // You can add more cards here if needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
