import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'package:leeyurani/ui/constants/constant.dart';

class HeadItem extends StatelessWidget {
  final String? iconPath;
  final String? title;
  final Color? customColor;
  const HeadItem({
    Key? key,
    required this.iconPath,
    required this.title,
    this.customColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: customColor ?? grayColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 4)
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: WebsafeSvg.asset(
              iconPath!,
              color: primaryColor,
              width: 32,
              height: 32
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title!,
          style: styleTitle.copyWith(
            fontSize: 40,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 100,
          height: 1,
          color: primaryColor,
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 1,
          color: primaryColor,
        )
      ],
    );
  }
}
