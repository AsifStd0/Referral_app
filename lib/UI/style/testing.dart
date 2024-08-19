import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refferalapp/UI/style/colors.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colorBlackGrey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: colorBlackGrey)),
          ),
        ),
      )),
      // body: Center(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 10),
      //     child: TextFormField(
      //       initialValue: "",
      //       decoration: InputDecoration(
      //         labelStyle: TextStyle(
      //           color: colorBlackGrey,
      //           fontSize: FontSize.s12,
      //           fontWeight: FontWeight.w200,
      //         ),
      //         suffixIcon: widget,
      //         hintStyle: TextStyle(),
      //         enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(10),
      //             borderSide: BorderSide(color: colorBlackGrey)),
      //         focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(10.r),
      //             borderSide: BorderSide(color: colorBlackGrey)),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
