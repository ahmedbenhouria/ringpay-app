import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ring_pay/core/configs/assets/app_images.dart';
import 'package:ring_pay/core/configs/assets/app_vectors.dart';
import 'package:ring_pay/core/configs/theme/app_colors.dart';
import 'package:ring_pay/presentation/transactions/transactions.dart';

import '../../core/configs/scale_size.dart';
import '../accounts/accounts.dart';
import '../cards/cards.dart';
import '../home/home.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 0;

  Widget _appBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: currentIndex == 0 ? AppColors.primary : Colors.white,
      toolbarHeight: 69.0,
      backgroundColor: currentIndex == 0 ? AppColors.primary : Colors.white,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(),
      leading: Builder(
        builder:
            (context) => Container(
              margin: EdgeInsets.only(left: 3),
              child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  AppVectors.menu,
                  colorFilter: ColorFilter.mode(
                    currentIndex == 0 ? Colors.white : Colors.black,
                    BlendMode.srcIn,
                  ),
                  width: 21,
                  height: 21,
                ),
              ),
            ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          AppImages.logoApp,
          color: currentIndex == 0 ? Colors.white : Colors.black,
          width: 125,
          height: 125,
          fit: BoxFit.contain,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 3),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppVectors.notification,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
              width: 23,
              height: 23,
            ),
          ),
        ),
      ],
    );
  }

  Widget _appBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
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
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColors.primary : const Color(0xff707070),
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
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColors.primary : const Color(0xff707070),
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
                currentIndex == 2 ? AppColors.primary : const Color(0xff707070),
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
                currentIndex == 3 ? AppColors.primary : const Color(0xff707070),
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Transactions',
        ),
      ],
    );
  }

  Widget _appDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                AppImages.profileImage,
                                width: 46,
                                height: 46,
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "johndoe@gmail.com",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff737373),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).closeDrawer();
                              },
                              icon: SvgPicture.asset(
                                AppVectors.close,
                                width: 14,
                                height: 14,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11),
              child: Column(
                children: [
                  ListTile(
                    minLeadingWidth: 15,
                    leading: SvgPicture.asset(
                      AppVectors.expenses,
                      width: 14,
                      height: 14,
                    ),
                    title: const Text(
                      'Expenses',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 15,
                    leading: SvgPicture.asset(
                      AppVectors.virtualCard,
                      width: 16,
                      height: 16,
                    ),
                    title: const Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 15,
                    leading: SvgPicture.asset(
                      AppVectors.payroll,
                      width: 19,
                      height: 19,
                    ),
                    title: const Text(
                      'Payroll',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 15,
                    leading: SvgPicture.asset(
                      AppVectors.profile,
                      width: 17,
                      height: 17,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 15,
                    leading: SvgPicture.asset(
                      AppVectors.settings,
                      width: 19,
                      height: 19,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 11, bottom: 40),
              child: ListTile(
                minLeadingWidth: 15,
                leading: SvgPicture.asset(
                  AppVectors.logout,
                  width: 16,
                  height: 16,
                ),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff707070),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screensList = const [
      HomeScreen(),
      CardsScreen(),
      AccountsScreen(),
      TransactionsScreen(),
    ];

    return Scaffold(
      backgroundColor: currentIndex == 0 ? AppColors.primary : Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(69.0),
        child: _appBar(context),
      ),
      floatingActionButton:
          currentIndex == 1
              ? Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: SizedBox(
                  width: 168,
                  height: 51,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff25B14F).withOpacity(0.6),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff25B14F),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppVectors.plus,
                            width: 23,
                            height: 23,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'New Card',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              : null,
      drawer: _appDrawer(),
      bottomNavigationBar: _appBottomNavBar(context),
      body: screensList[currentIndex],
    );
  }
}
