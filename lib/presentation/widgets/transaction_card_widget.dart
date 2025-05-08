import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/theme/app_colors.dart';

class TransactionCardWidget extends StatelessWidget {
  final String transactionLabel;
  final String transactionAmount;
  final Color amountTextColor;
  final String timestamp;
  final String iconPath;
  final Color bgColor;

  const TransactionCardWidget({
    required this.transactionLabel,
    required this.transactionAmount,
    required this.amountTextColor,
    required this.timestamp,
    required this.iconPath,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 82,
      child: Card(
        elevation: 0.0,
        color: AppColors.greyBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: bgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: SvgPicture.asset(iconPath, fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
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
                            style: TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                transactionAmount,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: amountTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
