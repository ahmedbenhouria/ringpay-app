import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../core/configs/theme/app_colors.dart';

Widget phoneNumberTextField(BuildContext context) {
  return IntlPhoneField(
    decoration: InputDecoration(
      hintText: 'Phone Number',
      hintStyle: TextStyle(color: AppColors.greyText, fontSize: 16),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: AppColors.red, width: 1.3),
      ),
    ),
    initialCountryCode: 'US',
    showDropdownIcon: true,
    dropdownIconPosition: IconPosition.trailing,
    flagsButtonPadding: const EdgeInsets.only(left: 16),
    showCountryFlag: true,
    dropdownTextStyle: TextStyle(color: AppColors.greyText, fontSize: 15),
    pickerDialogStyle: PickerDialogStyle(
      countryCodeStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      searchFieldInputDecoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        hintText: "Search Country...",
        hintStyle: TextStyle(color: AppColors.greyText, fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      backgroundColor: Colors.white,
    ),
    onChanged: (phone) {
      print(phone.completeNumber);
    },
  );
}
