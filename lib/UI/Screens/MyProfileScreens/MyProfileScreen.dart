import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/model/appuser.dart';
import 'EditProfile.dart';
import 'EditProfileScreen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfile = Provider.of<EditProfile>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 62.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          Get.back();
                        }),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        "My Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetailsWidget(
                      title: 'Full Name',
                      subtitle: user!.firstName! + ' ' + user!.lastName!,
                    ),
                    SizedBox(height: 20.h),
                    ProfileDetailsWidget(
                      title: 'Phone number',
                      subtitle: user!.phoneNumber!,
                    ),
                    SizedBox(height: 20.h),
                    ProfileDetailsWidget(
                      title: 'Address',
                      subtitle: user!.address!,
                    ),
                    SizedBox(height: 20.h),
                    ProfileDetailsWidget(
                      title: 'Email',
                      subtitle: user!.email!,
                    ),
                    SizedBox(height: 20.h),
                    ProfileDetailsWidget(
                      title: 'Company Name',
                      subtitle: user!.company!,
                    ),
                    SizedBox(height: 20.h),
                    ProfileDetailsWidget(
                      title: 'W9 with Service Restoration?',
                      subtitle: user!.w9Form
                          ? 'Yes I completed & Submitted it'
                          : "No I have not completed it & Submitted it",
                    ),
                  ],
                ),
              ),
              // Spacer(),
              SizedBox(
                height: Get.height / 4,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => EditProfileScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  height: 66.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Color(0xFF22408F)),
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  ),
                  child: Center(
                    child: Text(
                      "Edit Profile Details",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF22408F), fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  ProfileDetailsWidget({
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
