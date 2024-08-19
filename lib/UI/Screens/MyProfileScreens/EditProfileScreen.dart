import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:refferalapp/UI/Screens/MyProfileScreens/EditProfile.dart';

import '../../../core/model/appuser.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../common_widgets/cusomtText_field/custom_Text_field.dart';
import '../../common_widgets/custom button/custom_back_button.dart';
import '../../style/colors.dart';
import '../RestorationForm/restoration_lost.dart';
import '../RestorationForm/restoration_lost2.dart';

String? select;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final editProfile = Provider.of<EditProfile>(context, listen: false);
    editProfile.firstName.text = user!.firstName!;
    editProfile.lasteName.text = user!.lastName!;
    editProfile.address.text = user!.address!;
    editProfile.phoneNumber.text = user!.phoneNumber!;
    editProfile.company.text = user!.company!;
    editProfile.w9Form = user!.w9Form
        ? "Yes I completed & Submitted it"
        : "No I have not completed it";
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
                      'Edit Your Details',
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
                      hintText: editProfile.firstName.text,
                      controller: editProfile.firstName,
                      onChanged: (value) {
                        editProfile.firstName.text = value;
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your First Name ';
                      //   }
                      //   return null;
                      // },
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
                      hintText: editProfile.lasteName.text,
                      onChanged: (value) {
                        editProfile.lasteName.text = value;
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your Last Name ';
                      //   }
                      //   return null;
                      // },
                      controller: editProfile.lasteName,
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
                      hintText: editProfile.address.text,
                      onChanged: (value) {
                        editProfile.address.text = value;
                      },
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your Address';
                      //   }
                      //   return null;
                      // },
                      controller: editProfile.address,
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
                      onChanged: (value) {
                        editProfile.phoneNumber.text = value;
                      },
                      hintText: editProfile.phoneNumber.text,
                      textInputType: TextInputType.phone,
                      // validator: (value) {
                      //   int l = value.length;
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your PhoneNumer ';
                      //   } else if (l < 12) {
                      //     return ' PhoneNumer is too long ';
                      //   }
                      //   return null;
                      // },
                      controller: editProfile.phoneNumber,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(
                          "assets/images/phone.png",
                          height: 20.h,
                          width: 20.h,
                        ),
                      )),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      hintText: editProfile.company.text,
                      onChanged: (value) {
                        editProfile.company.text = value;
                      },
                      controller: editProfile.company,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your Company ';
//                         }else if(value<12){
// return 'Please enter your Company ';
//                         }
//                         return null;
//                       },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 20.h),
                Consumer<EditProfile>(builder: (context, EditProfile1, _) {
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
                            groupValue: EditProfile1.w9Form,
                            onChanged: (value) {
                              EditProfile1.updateW9(value.toString());
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
                            groupValue: EditProfile1.w9Form,
                            onChanged: (value) {
                              EditProfile1.updateW9(value.toString());
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }),
                SizedBox(height: 40.h),
                Consumer<EditProfile>(builder: (context, EditProfile1, _) {
                  return GestureDetector(
                    onTap: () async {
                      if (EditProfile1.isLoading == false
                          // &&_formKey.currentState!.validate()
                          ) {
                        String a = await EditProfile1.EditProfileUser(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color(0xFF22408F),
                              content: Text('Kindly Correct The Input Feilds')),
                        );
                      }
                    },
                    child: CustomContainer(
                      width: 382.w,
                      height: 66.h,
                      boarderRadius: 20.sp,
                      color: mainBlueColor,
                      widget: Center(
                        child: editProfile.isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                "Update Profile",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 20.sp,
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
