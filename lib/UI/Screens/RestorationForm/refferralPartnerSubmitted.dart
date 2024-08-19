import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:refferalapp/UI/Screens/RestorationForm/restoration_lost2.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../style/colors.dart';
import '../SignIn/sign_in_screen.dart';

class RefferralPartnerCreated extends StatefulWidget {
  const RefferralPartnerCreated({super.key});

  @override
  State<RefferralPartnerCreated> createState() =>
      _RefferralPartnerCreatedState();
}

class _RefferralPartnerCreatedState extends State<RefferralPartnerCreated> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFC),
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                SizedBox(height: 30.h),
                Container(
                  height: 124.h,
                  width: 134.w,
                  child: Image.asset('assets/images/logo2.png'),
                ),
                SizedBox(height: 70.h),
                Container(
                  height: 192.h,
                  width: 382.w,
                  child: Lottie.asset('assets/images/email.json'),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Refferal Partner Created",
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Emails sent to admin once your  \n refferal partner get approved\n they will recive a confirmation\n email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorBlack.withOpacity(0.5),
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () async {
                    Get.offAll(HomeScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomContainer(
                      width: 382.w,
                      height: 66.h,
                      boarderRadius: 20.sp,
                      color: mainBlueColor,
                      widget: Center(
                        child: Text(
                          "DONE",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
