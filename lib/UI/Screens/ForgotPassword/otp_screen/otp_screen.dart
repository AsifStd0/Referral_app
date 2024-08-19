import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/ForgotPassword/password_screen/password_screen.dart';
import 'package:refferalapp/UI/Screens/ForgotPassword/password_screen/password_screen_provider.dart';
import 'package:refferalapp/UI/Screens/SignIn/sign_in_screen.dart';
import 'package:refferalapp/UI/common_widgets/cuctom_container/custom_container.dart';
import 'package:refferalapp/UI/common_widgets/cusomtText_field/custom_Text_field.dart';
import 'package:refferalapp/UI/style/colors.dart';

class OtpScreen extends StatefulWidget {
  final id;
  final otp;
  const OtpScreen({super.key, this.id, this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  String? userpin;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    log('this is password screen and Udid is ${widget.id}  ${widget.otp}');
    return ChangeNotifierProvider(
        create: (context) => PasswordProvider(),
        child: Consumer<PasswordProvider>(
            builder: (BuildContext context, model1, Widget? child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffFAFAFC),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back_ios),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 124.h,
                            width: 134.w,
                            child: Image.asset('assets/images/logo2.png'),
                          ),
                        ),
                        SizedBox(height: 70.h),
                        Padding(
                          padding: EdgeInsets.only(left: 28.0),
                          child: Text(
                            "Enter OTP you received on your email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorBlack.withOpacity(0.5),
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Align(
                          alignment: Alignment.center,
                          child: OTPTextField(
                            length: 6,
                            width: MediaQuery.of(context).size.width - 50,
                            fieldWidth: 40,
                            style: TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                              userpin = pin;
                            },
                          ),
                        ),
                        SizedBox(height: 130.h),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              print('$userpin ${widget.otp}');
                              if (userpin == widget.otp.toString()) {
                                print('otp is correct');
                                Get.to(
                                  () => PasswordScreen(
                                    id: widget.id,
                                  ),
                                );
                              }
                            },
                            child: CustomContainer(
                              width: 322.w,
                              height: 66.h,
                              boarderRadius: 20.sp,
                              color: mainBlueColor,
                              widget: Center(
                                child: isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Text(
                                        "SUBMIT",
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
            ),
          );
        }));
  }
}
