import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refferalapp/UI/style/colors.dart';

import '../../style/fonts.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool obsecureText;

  final Widget? widget;
  final int? maxLine;
  final String? lableText;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String? initialValue;
  final validator;

  // TextEditingController? controller = TextEditingController();
  final Function(String)? onChanged;
  CustomTextField(
      {Key? key,
      this.hintText = "",
      // this.controller,
      // required this.onChanged,
      this.obsecureText = false,
      this.textInputType = TextInputType.text,
      this.widget,
      this.maxLine = 1,
      this.lableText,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      onChanged: onChanged,
      initialValue: initialValue ?? "",
      maxLines: maxLine,

      cursorColor: mainBlueColor,
      keyboardType: textInputType,
      // controller: controller,
      obscureText: obsecureText,
      // autovalidateMode: AutovalidateMode.always,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: lableText ?? "",
        labelStyle: TextStyle(
          color: colorBlackGrey,
          fontSize: FontSize.s12,
          fontWeight: FontWeight.w200,
        ),
        prefixIcon: widget,
        hintStyle: TextStyle(
          color: colorBlack.withOpacity(0.5),
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: colorBlackGrey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: colorBlackGrey)),
      ),
    );
  }
}
