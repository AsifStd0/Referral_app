import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/model/appuser.dart';
import '../../common_widgets/cuctom_container/custom_container.dart';
import '../../style/colors.dart';
import '../SignIn/sign_in_screen.dart';

class RestorationLostFrom2 extends StatefulWidget {
  const RestorationLostFrom2({super.key});

  @override
  State<RestorationLostFrom2> createState() => _RestorationLostFrom2State();
}

class _RestorationLostFrom2State extends State<RestorationLostFrom2> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xffFAFAFC),
        body: ListView(
          children: [
            InkWell(
              onTap: () async {
                // await FirebaseAuth.instance.signOut();
                SharedPreferences? shared;
                shared = await SharedPreferences.getInstance();
                shared.setBool('isalready', false);
                Get.offAll(SignInScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "LogOut",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(Icons.exit_to_app)
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Container(
                height: 60.h,
                width: 60.w,
                child: Image.asset(
                  "assets/images/logo2.png",
                  // color: Colors.amber,
                )),
            // Container(
            //   color: Colors.amber,
            //   height: 124.h,
            //   width: 134.w,
            //   child: Image.asset(
            //     'assets/logo.png',
            //     color: Colors.red,
            //   ),
            // ),
            SizedBox(height: 40.h),
            Container(
              height: 244.h,
              width: 382.w,
              decoration: BoxDecoration(),
              child: Lottie.asset('assets/images/done.json'),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account Created Successfully",
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "You will be able to login after \nAdmin Approval",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : InkWell(
                    onTap: () async {
                      int j = 0;
                      List<String> allIDs = [];
                      setState(() {
                        loading = true;
                      });
                      final snapshot = await FirebaseFirestore.instance
                          .collection("Users")
                          .get();
                      if (snapshot.docs.length > 0) {
                        for (int i = 0; i < snapshot.docs.length; i++) {
                          allIDs.add(snapshot.docs[i].data()['Udid']);
                          if (snapshot.docs[i].data()['Udid'] == user!.udid) {
                            log('11111111111111111 Accepted index i is ? ? $j $i ');

                            j = i;
                            log('2222222222222222222 Accepted index i is ? ? $j  $i ');
                          }
                        }
                      }
                      if (allIDs.contains(user!.udid)) {
                        log('################# Accepted index i is ? ? $j');
                        print('id found *********  user id is matched');
                        print('${user!.udid}');
                        if (snapshot.docs[j].data()['Accepted'] == "Accepted") {
                          Get.offAll(HomeScreen());
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "ALERT",
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text(
                                    "You have not been verified by the admin yet"),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "ALERT",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text(
                                  "You have been denied access by the admin. Please try again"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Get.offAll(SignInScreen());
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }

                      setState(() {
                        loading = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomContainer(
                        width: 382.w,
                        height: 66.h,
                        boarderRadius: 20.sp,
                        color: mainBlueColor,
                        widget: Center(
                          child: Text(
                            "DONE",
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
