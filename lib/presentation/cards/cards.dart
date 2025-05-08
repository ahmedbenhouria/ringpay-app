import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dropdown.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:ring_pay/presentation/cards/card_details.dart';
import 'package:ring_pay/presentation/widgets/credit_card_widget.dart';
import 'package:ring_pay/presentation/widgets/credit_card_widget2.dart';
import '../../core/configs/theme/app_colors.dart';
import '../../core/configs/utils/scale_size.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

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

  Widget _buildCardComponent(int index, String tag, BuildContext context) {
    callback() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CardDetailsScreen(tag: tag)),
      );
    }

    return index == 0
        ? CreditCardWidget(callback: callback)
        : CreditCardWidget2(callback: callback);
  }

  @override
  Widget build(BuildContext context) {
    List<String> cards = const ['card_1', 'card_2', 'card_3'];

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
                      'All Cards',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      ),
                    ),
                    Text(
                      'Manage all your virtual cards',
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
              children: List.generate(cards.length, (index) {
                final tag = cards[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Hero(
                    tag: tag,
                    child: Material(
                      type: MaterialType.transparency,
                      child: _buildCardComponent(index, tag, context),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
