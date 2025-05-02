import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ring_pay/presentation/accounts/account_details.dart';

import '../../core/configs/theme/app_colors.dart';
import '../../core/configs/utils/scale_size.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  Widget _buildBankAccountItem(Widget accountTypeChild, VoidCallback callback) {
    return InkWell(
      onTap: callback,
      child: DottedBorder(
        color: Color(0xff9BDBAE),
        strokeWidth: 1,
        dashPattern: [6, 5],
        borderPadding: EdgeInsets.all(1.52),
        borderType: BorderType.RRect,
        radius: Radius.circular(20),
        child: Container(
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightGreyBackground,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff666666),
                          ),
                        ),
                        Text(
                          '\$250.03',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Acc No: 2454 6767 90',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    accountTypeChild,
                  ],
                ),
                Text(
                  'Wema Bank',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff404040),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdownItem(Country country) => Row(
    children: <Widget>[
      Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
        child: ClipOval(
          child: SizedBox(
            width: 26,
            height: 26,
            child: CountryPickerUtils.getDefaultFlagImage(country),
          ),
        ),
      ),
      SizedBox(width: 7.0),
      Text(
        "${country.currencyCode}",
        style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xff404040)),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Accounts',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      ),
                    ),
                    Text(
                      'Manage all your bank accounts',
                      style: TextStyle(
                        color: AppColors.greyText,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.lightGreyBackground,
                  ),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      buttonTheme: ButtonThemeData(alignedDropdown: true),
                    ),
                    child: CurrencyPickerDropdown(
                      initialValue: 'GBP',
                      itemBuilder: _buildCurrencyDropdownItem,
                      onValuePicked: (Country? country) {
                        print("${country?.name}");
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Column(
              spacing: 15,
              children: [
                _buildBankAccountItem(
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff22A148),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: Text(
                        'Primary Account',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(),
                      ),
                    );
                  },
                ),
                _buildBankAccountItem(
                  DottedBorder(
                    color: Color(0xffD7D7D7),
                    strokeWidth: 1,
                    dashPattern: [5, 3],
                    borderPadding: EdgeInsets.all(1.52),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF5F5F5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Center(
                        child: Text(
                          'Shopping',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(),
                      ),
                    );
                  },
                ),
                _buildBankAccountItem(
                  DottedBorder(
                    color: Color(0xffD7D7D7),
                    strokeWidth: 1,
                    dashPattern: [5, 3],
                    borderPadding: EdgeInsets.all(1.52),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffF5F5F5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Center(
                        child: Text(
                          'Purchase',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountDetailsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
