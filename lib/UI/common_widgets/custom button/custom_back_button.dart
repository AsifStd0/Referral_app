import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/colors.dart';
import '../../style/fonts.dart';
import '../../style/fontsmanager.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  CustomBackButton({
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: color ?? colorBlack,
          ),
          SizedBox(
            width: 10,
          )
          // Text(
          //   'Back',
          //   style: kTextstyle(
          //       fontSize: FontSize.s12,
          //       fontWeight: FontWeight.w400,
          //       color: color ?? whiteColor),
          // )
        ],
      ),
    );
  }
}
