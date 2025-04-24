import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_pay/core/configs/assets/app_images.dart';
import 'package:ring_pay/core/configs/assets/app_vectors.dart';
import 'package:ring_pay/core/configs/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  Widget _appBar() {
    return AppBar(
      surfaceTintColor: AppColors.primary,
      toolbarHeight: 69.0,
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppVectors.menu, width: 21, height: 21),
      ),
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          AppImages.logoApp,
          width: 125,
          height: 125,
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppVectors.notification,
            width: 23,
            height: 23,
          ),
        ),
      ],
    );
  }

  Widget _appBottomNavBar() {
    return SizedBox(
      height: 92,
      child: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color(0xff707070),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(3.3),
              child: SvgPicture.asset(
                AppVectors.home,
                width: 23,
                height: 23,
                colorFilter: ColorFilter.mode(
                  currentIndex == 0
                      ? AppColors.primary
                      : const Color(0xff707070),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(5.5),
              child: SvgPicture.asset(
                AppVectors.cards,
                width: 19,
                height: 19,
                colorFilter: ColorFilter.mode(
                  currentIndex == 1
                      ? AppColors.primary
                      : const Color(0xff707070),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.5),
              child: SvgPicture.asset(
                AppVectors.accounts,
                width: 21,
                height: 21,
                colorFilter: ColorFilter.mode(
                  currentIndex == 2
                      ? AppColors.primary
                      : const Color(0xff707070),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.2),
              child: SvgPicture.asset(
                AppVectors.transactions,
                width: 21,
                height: 21,
                colorFilter: ColorFilter.mode(
                  currentIndex == 3
                      ? AppColors.primary
                      : const Color(0xff707070),
                  BlendMode.srcIn,
                ),
              ),
            ),
            label: 'Transactions',
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> quickAccessItems = const [
    {'title': 'Virtual Cards', 'icon': AppVectors.virtualCard},
    {'title': 'Bank Accounts', 'icon': AppVectors.bankAccounts},
    {'title': 'Expenses', 'icon': AppVectors.expenses},
    {'title': 'Payroll', 'icon': AppVectors.payroll},
  ];

  Widget _quickAccessCard(String title, String imagePath) {
    return SizedBox(
      width: 150,
      height: 162,
      child: Card(
        elevation: 0.0,
        color: AppColors.greyBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
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
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionCard(
    String transactionLabel,
    String transactionAmount,
    Color amountTextColor,
    String timestamp,
    String iconPath,
    Color bgColor,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 90,
      child: Card(
        elevation: 0.0,
        color: AppColors.greyBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        timestamp,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                        ),
                      ),
                      Text(
                        transactionLabel,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                transactionAmount,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: amountTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _balanceHeader() {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      'Primary Balance',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      AppVectors.eye,
                      width: 15,
                      height: 15,
                      color: Colors.white,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 18,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white, width: 1.3),
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
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white, width: 1.2),
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
            top: -15,
            child: SvgPicture.asset(AppVectors.lineBg),
          ),
        ],
      ),
    );
  }

  Widget _mainContent() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      // Add this to fix the scrolling issue and make sure content goes all the way to the bottom
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 25, left: 15),
          children: [
            const Text(
              "Quick Access",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                spacing: 10,
                children: [
                  for (var item in quickAccessItems) ...[
                    _quickAccessCard(item['title']!, item['icon']!),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                spacing: 10,
                children: [
                  _transactionCard(
                    'Payroll',
                    '\$7,200',
                    AppColors.red,
                    '2min ago',
                    AppVectors.person,
                    Color(0xffD9D8F7),
                  ),
                  _transactionCard(
                    'Payroll',
                    '\$7,200',
                    AppColors.red,
                    '4min ago',
                    AppVectors.person,
                    Color(0xffD9D8F7),
                  ),
                  _transactionCard(
                    'Expenses',
                    '\$910',
                    AppColors.red,
                    '10min ago',
                    AppVectors.bankNotes,
                    Color(0xffF9EEBA),
                  ),
                  _transactionCard(
                    'Fund Wallet',
                    '\$310',
                    AppColors.primary,
                    '10min ago',
                    AppVectors.bankNotes,
                    Color(0xffF9EEBA),
                  ),
                  _transactionCard(
                    'Receive Fund',
                    '\$350',
                    AppColors.primary,
                    '10min ago',
                    AppVectors.bankNotes,
                    Color(0xffF9EEBA),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(69.0),
        child: _appBar(),
      ),
      bottomNavigationBar: _appBottomNavBar(),
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: size.height * 0.24,
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
      ),
    );
  }
}
