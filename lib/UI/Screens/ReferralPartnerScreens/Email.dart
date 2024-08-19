import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/model/appuser.dart';
import '../SubmitNewRefferals/submitnew_refferal.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final refferral = Provider.of<SubmitRefferal>(context, listen: false);
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Email",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "New Referral Received",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        DateTime.now().day.toString() +
                            " / " +
                            DateTime.now().month.toString() +
                            " / " +
                            DateTime.now().year.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    alignment: Alignment.center,
                    width: 1.sw,
                    height: 50.h,
                    color: Colors.white,
                    child: Text(
                      "Customer Person's Details",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmailDetailsWidget(
                        title: 'Name',
                        subtitle: refferral.customerfirsttName.text +
                            " " +
                            refferral.customerlasttName.text,
                      ),
                      EmailDetailsWidget(
                        title: 'Phone',
                        subtitle: refferral.customerphoneNumber.text,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  EmailDetailsWidget(
                    title: 'Address',
                    subtitle: refferral.customeraddress.text +
                        " " +
                        refferral.city.text +
                        " " +
                        refferral.state.text +
                        " " +
                        refferral.zip.text,
                  ),
                  SizedBox(height: 10.h),
                  EmailDetailsWidget(
                    title: 'Email',
                    subtitle: refferral.customeremail.text,
                  ),
                  SizedBox(height: 10.h),
                  EmailDetailsWidget(
                    title: 'Company Name',
                    subtitle: refferral.customercompany.text,
                  ),
                  SizedBox(height: 10.h),
                  EmailDetailsWidget(
                    title: 'Description',
                    subtitle: refferral.customerlostDescription.text,
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    alignment: Alignment.center,
                    width: 1.sw,
                    height: 50.h,
                    color: Colors.white,
                    child: Text(
                      "Referral Person's Details",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmailDetailsWidget(
                        title: 'Full Name',
                        subtitle: user!.firstName! + " " + user!.lastName!,
                      ),
                      EmailDetailsWidget(
                        title: 'Phone Number',
                        subtitle: user!.phoneNumber!,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  EmailDetailsWidget(
                    title: 'Company Name',
                    subtitle: user!.company!,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: Get.height / 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: double.infinity,
                height: 90.h,
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Service Restoration",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Complete Restoration Services",
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Privacy Policy and Terms & Conditions",
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EmailDetailsWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  EmailDetailsWidget({
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
            fontSize: 12.sp,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
