import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:refferalapp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:refferalapp/main.dart';

class RefferalSubmittedScreen extends StatefulWidget {
  const RefferalSubmittedScreen({super.key});

  @override
  State<RefferalSubmittedScreen> createState() =>
      _RefferalSubmittedScreenState();
}

class _RefferalSubmittedScreenState extends State<RefferalSubmittedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: ListView(
          children: [
            Container(
                height: 62.h,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Referral Details Submitted",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 67.h,
                    ),
                    Lottie.asset('assets/done.json',
                        height: 344.h, width: 344.w),
                    SizedBox(
                      height: 19.h,
                    ),
                    Text(
                      "Emails and text notifications have been sent successfully to the Service Restoration emergency response team",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(
                      height: 110.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomeScreen()),
                            (route) => false);
                      },
                      child: Container(
                        height: 66.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF22408F),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: Text(
                            "DONE",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 20.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
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
