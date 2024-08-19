import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/colors.dart';
import '../../style/fonts.dart';
import '../../style/fontsmanager.dart';
import '../cuctom_container/custom_container.dart';

class RoundedButton extends StatelessWidget {
  final String? txt;
  final Color? borderColor;
  final Function()? onPrassed;
  RoundedButton({
    this.borderColor,
    this.txt,
    this.onPrassed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPrassed,
      child: CustomContainer(
        height: 40.h,
        width: 170.w,
        borderColor: borderColor ?? colorbluewhite,
        boarderRadius: 10,
        borderwidth: 1,
        color: whiteColor,
        widget: Center(
          child: Text(
            txt ?? "",
            style: kTextstyle(
              color: colorbluewhite,
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
