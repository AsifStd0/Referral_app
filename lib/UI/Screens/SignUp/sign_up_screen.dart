import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/SignUp/sign_up.dart';

import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../common_widgets/cusomtText_field/custom_Text_field.dart';
import '../../common_widgets/custom button/custom_back_button.dart';
import '../../style/colors.dart';
import '../../style/fonts.dart';
import '../ReferralPartnerScreens/NewReferralPartnerScreen.dart';

String? select;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedAvatarIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final signUp = Provider.of<SignUp>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFC),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomBackButton()),
                    SizedBox(
                      width: 27.5.w,
                    ),
                    Text(
                      'REFERRAL PARTNER SIGN UP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      "Referral Partner Info",
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
                      hintText: "First Name",
                      controller: signUp.firstName,
                      onChanged: (value) {
                        signUp.firstName.text = value.toLowerCase();
                      },
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/profile.png",
                          height: 20.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "Last Name",
                      onChanged: (value) {
                        signUp.lasteName.text = value.toLowerCase();
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your Last Name ';
                      //   }
                      //   return null;
                      // },
                      controller: signUp.lasteName,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/profile.png",
                          height: 20.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "Street Address",
                      onChanged: (value) {
                        signUp.address.text = value.toLowerCase();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Street Address';
                        }
                        return null;
                      },
                      controller: signUp.address,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/location.png",
                          height: 20.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "City",
                      onChanged: (value) {
                        signUp.city.text = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your City';
                        }
                        return null;
                      },
                      controller: signUp.address,
                      widget: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.location_city,
                            color: mainBlueColor,
                          ))),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "State",
                      onChanged: (value) {
                        signUp.state.text = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your State';
                        }
                        return null;
                      },
                      controller: signUp.address,
                      widget: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.flag,
                            color: mainBlueColor,
                          ))),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "ZIP",
                      onChanged: (value) {
                        signUp.zip.text = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your ZIP';
                        }
                        return null;
                      },
                      controller: signUp.address,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/location.png",
                          height: 20.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: IntlPhoneField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter your PhoneNumer ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      counterText: "",
                      fillColor: Colors.white,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      hintText: "Phone number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: colorBlackGrey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: colorBlackGrey)),
                    ),
                    onChanged: (value) {
                      signUp.phoneNumber.text =
                          value.countryCode + value.number;

                      log(signUp.phoneNumber.text);
                    },
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "Company",
                      onChanged: (value) {
                        signUp.company.text = value.toLowerCase();
                      },
                      controller: signUp.company,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Company ';
                        }
                        return null;
                      },
                      widget: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/images/company.png",
                          height: 15.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: "Job title",
                      onChanged: (value) {
                        signUp.jobTittle.text = value.toLowerCase();
                      },
                      controller: signUp.jobTittle,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your job title ';
                        }
                        return null;
                      },
                      widget: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Icon(
                            Icons.work,
                            color: Color(0xFF22408F),
                          ))),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                    hintText: "Email",
                    onChanged: (value) {
                      signUp.email.text = value.toLowerCase();
                    },
                    controller: signUp.email,
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
                    hintText: "Password",
                    onChanged: (value) {
                      signUp.password.text = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password should be greater than 6 digits';
                      }
                      return null;
                    },
                    controller: signUp.password,
                    widget: Icon(
                      Icons.lock,
                      color: mainBlueColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "W9 with Service Restoration?",
                        style: TextStyle(
                          color: colorBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Consumer<SignUp>(builder: (context, signUp1, _) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            selectedTileColor: mainBlueColor,
                            title: Text(
                              "Yes I completed & Submitted it",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w300),
                            ),
                            value: "Yes I completed & Submitted it",
                            groupValue: signUp1.w9Form,
                            onChanged: (value) {
                              signUp1.updateW9(value.toString());
                            },
                          ),
                        ),
                        Container(
                          // height: 30.h,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "No I have not completed it",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w300),
                            ),
                            value: "No I have not completed it",
                            groupValue: signUp1.w9Form,
                            onChanged: (value) {
                              signUp1.updateW9(value.toString());
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Select Avatar",
                        style: GoogleFonts.poppins(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Consumer<SignUp>(builder: (context, signUp2, _) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 1.sw,
                      height: 70.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: avatarList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              selectedAvatarIndex = index;

                              signUp2.setAvatar(avatarList[index]);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40.r,
                                  backgroundImage:
                                      AssetImage(avatarList[index]),
                                ),
                                selectedAvatarIndex == index
                                    ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 50.sp,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
                SizedBox(height: 40.h),
                Consumer<SignUp>(builder: (context, signUp1, _) {
                  return GestureDetector(
                    onTap: () async {
                      if (signUp1.isLoading == false) if (_formKey.currentState!
                          .validate()) {
                        await signUp1.signupUser(context);
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
                          child: signUp.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "SIGN UP",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
