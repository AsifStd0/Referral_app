import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/RestorationForm/restoration_lost2.dart';
import '../../../core/model/appuser.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../style/colors.dart';
import '../HomeScreen/HomeScreen.dart';
import '../SignIn/sign_in_screen.dart';

class RestorationLostFrom extends StatefulWidget {
  const RestorationLostFrom({super.key});

  @override
  State<RestorationLostFrom> createState() => _RestorationLostFromState();
}

class _RestorationLostFromState extends State<RestorationLostFrom> {
  bool loading = false;
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
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.offAll(SignInScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "LogOutbbbb",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(Icons.exit_to_app)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 124.h,
                  width: 134.w,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(height: 70.h),
                Container(
                  height: 192.h,
                  width: 382.w,
                  child: Lottie.asset('assets/images/email.json'),
                ),
                SizedBox(height: 60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Confirmation email has been sent!",
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
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kindly verify your email by clicking \non the link sent to it",
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
                loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          FirebaseAuth auth = FirebaseAuth.instance;

                          await auth.currentUser!.reload();
                          if (!auth.currentUser!.emailVerified) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Error",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: Text(
                                      "Email is not verified yet kindly go to your email address and verify your email"),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            user!.accepted != "Accepted"
                                ? Get.to(RestorationLostFrom2())
                                : Get.to(HomeScreen());
                          }
                          setState(() {
                            loading = false;
                          });
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
                                "GOT IT",
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
