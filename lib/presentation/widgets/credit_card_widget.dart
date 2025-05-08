import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/configs/assets/app_vectors.dart';

class CreditCardWidget extends StatelessWidget {
  final VoidCallback? callback;

  const CreditCardWidget({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 206,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff19191B),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subscriptions',
                        style: TextStyle(
                          color: Color(0xffD7D7D7),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset(
                        AppVectors.mastercard,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Pin:  ',
                              style: TextStyle(
                                color: Color(0xffD7D7D7),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SvgPicture.asset(
                              AppVectors.eyeOff,
                              width: 14,
                              height: 14,
                              colorFilter: ColorFilter.mode(
                                Color(0xffD7D7D7),
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          AppVectors.copy,
                          width: 14,
                          height: 14,
                          colorFilter: ColorFilter.mode(
                            Color(0xffD7D7D7),
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    '****  ****  ****  7876',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    minFontSize: 14,
                    presetFontSizes: [33, 31],
                    maxLines: 1,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Balance:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '\$250.03',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '11/25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CCV',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '098',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 9,
              right: 0,
              child: SvgPicture.asset(AppVectors.rectangle2),
            ),
            Positioned(
              top: 27,
              right: 0,
              child: SvgPicture.asset(AppVectors.rectangle1),
            ),
          ],
        ),
      ),
    );
  }
}
