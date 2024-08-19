import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle kTextstyle({
  Color? color,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  TextAlign? textAlign,
  double? letterSpacing,
  TextStyle? textStyle,
}) {
  var colorWhite;
  return TextStyle(
    fontFamily: fontFamily ?? "OpenSans-Regular",
    color: color ?? colorWhite,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing ?? 0.5,
  );
}
