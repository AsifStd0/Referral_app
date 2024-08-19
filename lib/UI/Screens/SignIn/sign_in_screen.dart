import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/SignIn/sign_in.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../common_widgets/cusomtText_field/custom_Text_field.dart';
import '../../style/colors.dart';
import '../ForgotPassword/forgotPassword_screen.dart';
import '../SignUp/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final signIn = Provider.of<SignIn>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFC),
        body: Form(
          key: _formKey,
          child: Container(
            height: Get.height,
            width: Get.width,
            child: ListView(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'REFERRAL PARTNER SIGN IN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Container(
                  height: 124.h,
                  width: 124.w,
                  child: Lottie.asset('assets/images/signin.json'),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset("assets/images/icons.png"),
                ),
                SizedBox(height: 50.h),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      "Login to Continue",
                      style: TextStyle(
                        color: colorBlack.withOpacity(0.5),
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    hintText: "Email",
                    onChanged: (value) {
                      signIn.email.text = value;
                    },
                    controller: signIn.email,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value) ==
                              false) {
                        return 'Please enter a valid email ';
                      }
                      return null;
                    },
                    widget: Icon(
                      Icons.mail,
                      color: mainBlueColor,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    obsecureText: true,
                    hintText: "Password",
                    onChanged: (value) {
                      signIn.password.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password should be greater than 6 digits';
                      }
                      return null;
                    },
                    controller: signIn.password,
                    widget: Icon(
                      Icons.lock,
                      color: mainBlueColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: colorBlack.withOpacity(0.5),
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Consumer<SignIn>(builder: (context, signIn1, _) {
                  return GestureDetector(
                    onTap: () async {
                      if (signIn1.isLoading == false) if (_formKey.currentState!
                          .validate()) {
                        log('signin page ontap is occur');
                        String a = await signIn1.signInpUser(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color(0xFF22408F),
                              content: Text('Kindly Correct The Input Feilds')),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: CustomContainer(
                        width: 382.w,
                        height: 66.h,
                        boarderRadius: 20.sp,
                        color: mainBlueColor,
                        widget: Center(
                          child: signIn1.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 20.sp,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New account?",
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 18.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                          color: mainBlueColor,
                          decoration: TextDecoration.underline,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
