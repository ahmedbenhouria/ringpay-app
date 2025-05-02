import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../core/configs/theme/app_colors.dart';
import '../widgets/main_button_component.dart';

class PrimaryCurrencyScreen extends StatelessWidget {
  const PrimaryCurrencyScreen({super.key});

  Widget _buildCurrencyDropdownItem(Country country) => Row(
    children: <Widget>[
      ClipOval(
        child: SizedBox(
          width: 26,
          height: 26,
          child: CountryPickerUtils.getDefaultFlagImage(country),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Set Primary Currency',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Choose the primary currency for your account. This can not be changed',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffECF8EC),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Currency',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                buttonTheme: ButtonThemeData(
                                  alignedDropdown: true,
                                ),
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
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MainButtonComponent(
                    buttonText: "Set Currency",
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (BuildContext context) => PrimaryCurrencyScreen(),
                        ),
                      );
                    },
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
