import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../common_widgets/cusomtText_field/custom_Text_field.dart';
import '../../style/colors.dart';
import 'forgot_password_provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
        create: (context) => ForgotPasswordProvider1(),
        child: Consumer<ForgotPasswordProvider1>(
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
                        SizedBox(height: 60.h),
                        Container(
                          height: 124.h,
                          width: 134.w,
                          child: Image.asset('assets/images/logo2.png'),
                        ),
                        SizedBox(height: 50.h),
                        SizedBox(height: 70.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Enter your email ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colorBlack.withOpacity(0.5),
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: CustomTextField(
                            hintText: "Email",
                            onChanged: (value) {
                              model1.email = value;
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
                        SizedBox(height: 60.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   "Kindly enter your email to recieve password reset link",
                            //   style: TextStyle(
                            //     color: colorBlack,
                            //     // fontSize: 20.sp,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            SizedBox(
                              width: 24.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 80.h),
                        model1.isload
                            ? Center(child: CircularProgressIndicator())
                            : GestureDetector(
                                onTap: () async {
                                  model1.getemail();
                                  // model1.checkEmail();
                                },
                                child: CustomContainer(
                                  width: 382.w,
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
