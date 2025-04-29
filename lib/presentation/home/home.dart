import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ring_pay/presentation/widgets/transaction_card_component.dart';

import '../../core/configs/assets/app_vectors.dart';
import '../../core/configs/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> quickAccessItems = const [
    {'title': 'Virtual Cards', 'icon': AppVectors.virtualCard},
    {'title': 'Bank Accounts', 'icon': AppVectors.bankAccounts},
    {'title': 'Expenses', 'icon': AppVectors.expenses},
    {'title': 'Payroll', 'icon': AppVectors.payroll},
  ];

  Widget _quickAccessCard(String title, String imagePath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 153,
          height: 163,
          child: Card(
            elevation: 0.0,
            color: AppColors.greyBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.5),
                      child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _balanceHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: AppColors.primary,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Primary Balance',
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
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
                    SizedBox(height: 5),
                    Text(
                      '\$30,050.56',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 18,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1.3,
                                ),
                              ),
                            ),
                            child: Text(
                              'Make Transfer',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(horizontal: 22),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 1.2,
                                ),
                              ),
                            ),
                            child: Text(
                              'Add Money',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: -19,
                child: SvgPicture.asset(AppVectors.lineBg),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mainContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: ListView(
              padding: EdgeInsets.only(top: 25, left: 15),
              children: [
                Text(
                  "Quick Access",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: 17),
                  child: Row(
                    spacing: 11,
                    children: [
                      for (var item in quickAccessItems) ...[
                        _quickAccessCard(item['title']!, item['icon']!),
                      ],
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Transactions",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    spacing: 11,
                    children: [
                      TransactionCardComponent(
                        transactionLabel: 'Payroll',
                        transactionAmount: '\$7,200',
                        amountTextColor: AppColors.red,
                        timestamp: '2min ago',
                        iconPath: AppVectors.person,
                        bgColor: Color(0xffD9D8F7),
                      ),

                      TransactionCardComponent(
                        transactionLabel: 'Payroll',
                        transactionAmount: '\$7,200',
                        amountTextColor: AppColors.red,
                        timestamp: '4min ago',
                        iconPath: AppVectors.person,
                        bgColor: Color(0xffD9D8F7),
                      ),

                      TransactionCardComponent(
                        transactionLabel: 'Expenses',
                        transactionAmount: '\$910',
                        amountTextColor: AppColors.red,
                        timestamp: '10min ago',
                        iconPath: AppVectors.bankNotes,
                        bgColor: Color(0xffF9EEBA),
                      ),

                      TransactionCardComponent(
                        transactionLabel: 'Fund Wallet',
                        transactionAmount: '\$310',
                        amountTextColor: AppColors.primary,
                        timestamp: '10min ago',
                        iconPath: AppVectors.bankNotes,
                        bgColor: Color(0xffF9EEBA),
                      ),

                      TransactionCardComponent(
                        transactionLabel: 'Receive Fund',
                        transactionAmount: '\$350',
                        amountTextColor: AppColors.primary,
                        timestamp: '10min ago',
                        iconPath: AppVectors.bankNotes,
                        bgColor: Color(0xffF9EEBA),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return NestedScrollView(
      headerSliverBuilder:
          (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: max(200, size.height * 0.237),
              floating: false,
              pinned: false,
              snap: false,
              backgroundColor: AppColors.primary,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(background: _balanceHeader()),
              elevation: 0,
            ),
          ],
      body: _mainContent(),
    );
  }
}
