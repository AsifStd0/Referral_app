import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:refferalapp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:refferalapp/UI/Screens/SignIn/sign_in_screen.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../style/colors.dart';
import '../RestorationForm/restoration_lost2.dart';
import '../onboarding_screen.dart/onboarding_screen.dart';

List numbers = [];
List ID = [];
List emails = [];
bool? onBoardingScreenViewed = false;
SharedPreferences? shared;

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void didChangeDependencies() async {
    shared = await SharedPreferences.getInstance();
    bool? isalready = shared!.getBool('isalready') ?? false;
    onBoardingScreenViewed =
        shared!.getBool('OnBoardingScreensViewed') ?? false;
    final snapshot = await FirebaseFirestore.instance.collection("Users").get();
    if (snapshot.docs.length > 0) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        log('${snapshot.docs[i].data()['Email']}');
        ID.add(snapshot.docs[i].data()['Udid']);
      }
    }

    await FirebaseFirestore.instance
        .collection("EmailsAndNumbers")
        .doc("emails")
        .get()
        .then((value) {
      emails = value["emails"];
      numbers = value["numbers"];
    });

    if (onBoardingScreenViewed!) {
      log('onboarding is called################################');
      if (isalready == true && ID.contains(shared!.getString('uid'))) {
        String? uid = shared!.getString('uid');
        log('UID is  $uid');
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(uid)
            .get()
            .then((value) {
          print('this is then function called');
          user = AppUser(
              address: value["Address"],
              company: value["CompanyName"],
              email: value["Email"],
              accepted: value["Accepted"],
              avatar: value["Avatar"],
              verified: value["Verified"],
              udid: value["Udid"],
              firstName: value["FirstName"],
              lastName: value["LastName"],
              password: value["Password"],
              phoneNumber: value["Phone"],
              w9Form: value["W9Form"],
              refferals: value["Refferals"],
              avgJobValue: value["AvgJobValue"],
              jobTittle: value["JobTittle"]);
        });
        log(user!.email.toString());
        log(user!.accepted.toString());
        user!.accepted!.toString() != "Accepted"
            ? Get.offAll(RestorationLostFrom2())
            : Get.offAll(HomeScreen());
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    }

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Container(
              height: 1.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 92.h,
                    width: 92.w,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(
                      "assets/images/newlogo.png",
                      // width: 107.w,
                      // height: 151.h,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Referral Program",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 92.h,
                    width: 92.w,
                    child: Lottie.asset('assets/images/splash.json'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
