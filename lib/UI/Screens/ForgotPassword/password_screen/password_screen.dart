import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/ForgotPassword/password_screen/password_screen_provider.dart';
import 'package:refferalapp/UI/Screens/SignIn/sign_in_screen.dart';
import 'package:refferalapp/UI/common_widgets/cuctom_container/custom_container.dart';
import 'package:refferalapp/UI/common_widgets/cusomtText_field/custom_Text_field.dart';
import 'package:refferalapp/UI/style/colors.dart';

import '../../SignUp/sign_up_screen.dart';

class PasswordScreen extends StatefulWidget {
  final id;
  const PasswordScreen({super.key, this.id});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    log('this is password screen and Udid is ${widget.id}');
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
                            "Enter Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorBlack.withOpacity(0.5),
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: CustomTextField(
                            obsecureText: true,
                            hintText: "Password",
                            onChanged: (value) {
                              model1.password = value;
                            },
                            controller: email,
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
                        Padding(
                          padding: EdgeInsets.only(left: 28.0),
                          child: Text(
                            "Confirm Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorBlack.withOpacity(0.5),
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: CustomTextField(
                            obsecureText: true,
                            hintText: "Confirm Password",
                            onChanged: (value) {
                              model1.confirmpassword = value;
                            },
                            controller: email,
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
                        SizedBox(height: 130.h),
                        model1.isload
                            ? CircularProgressIndicator()
                            : Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      model1.isload = true;
                                    });
                                    if (model1.password.length < 6) {
                                      Get.snackbar("Error",
                                          "Password must be 6 characters long");
                                      setState(() {
                                        model1.isload = false;
                                      });
                                    } else if (model1.password !=
                                        model1.confirmpassword) {
                                      Get.snackbar(
                                          // backgroundColor: ,
                                          "Error",
                                          "Password does not match");
                                      setState(() {
                                        model1.isload = false;
                                      });
                                    } else {
                                      log('this is databse function claaded ${widget.id}');
                                      log('${widget.id}');
                                      FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc(widget.id)
                                          .update({
                                        "Password": model1.password,
                                      }).then((value) {
                                        Get.snackbar("Success",
                                            "Password changed successfully");
                                        Get.offAll(SignInScreen());
                                      }).catchError((e) {
                                        Get.snackbar("Error", e.toString());
                                      });
                                      setState(() {
                                        model1.isload = false;
                                      });
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
                                              child:
                                                  CircularProgressIndicator(),
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
