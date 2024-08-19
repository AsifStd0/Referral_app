import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:refferalapp/UI/Screens/ReferralDetail/refferalDetails_screen.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:refferalapp/main.dart';

import '../HomeScreen/HomeScreen.dart';
import '../SubmitNewRefferals/submitnew_refferal_screen.dart';

class ReferralLeadsScreen extends StatefulWidget {
  const ReferralLeadsScreen({super.key});

  @override
  State<ReferralLeadsScreen> createState() => _ReferralLeadsScreenState();
}

class _ReferralLeadsScreenState extends State<ReferralLeadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: ListView(
          //  physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 62.h,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (() {
                          Get.off(() => HomeScreen());
                        }),
                        child: Icon(Icons.arrow_back_ios)),
                    Text(
                      "Referral Leads",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        Get.to(() => SubmitNewRefferals());
                      },
                      child: Container(
                          height: 100.h,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.r)),
                          ),
                          child: Center(
                            child: ListTile(
                              leading: Image.asset(
                                "assets/add-document.png",
                                height: 29.h,
                                width: 35.w,
                              ),
                              title: Text(
                                "Submit New Referral",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF22408F)),
                              ),
                              subtitle: Text(
                                "Submit new lead",
                                style: GoogleFonts.poppins(),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xFF22408F),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(height: 31.h),
                    Text(
                      "Previously Submitted leads",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Status",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp, color: Color(0xFF707070)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      // height: Get.height/3 * ,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Users")
                              .doc(user!.udid)
                              .collection("Refferals")
                              .orderBy("DateTime", descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              );
                            } else {
                              List<QueryDocumentSnapshot<Map<String, dynamic>>>
                                  items = snapshot.data!.docs;

                              return Container(
                                height:
                                    Get.height / 6 * snapshot.data!.docs.length,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot ds =
                                          snapshot.data!.docs[index];
                                      var timestamp =
                                          ds['DateTime'] as Timestamp;
                                      var dateTime = timestamp.toDate();
                                      return InkWell(
                                        onTap: () {
                                          print(
                                              'i am here at refferel lead screen ');
                                          Get.to(RefferralDetailsScreen(
                                            snapshot: ds,
                                          ));
                                        },
                                        child: Column(
                                          children: [
                                            if (index == 0)
                                              SizedBox(height: 25.h),
                                            Container(
                                              height: 100.h,
                                              width: width,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 3,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(19.r)),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  height: 100.h,
                                                  // color: Colors.amber,
                                                  child: ListTile(
                                                    title: Text(
                                                      ds["CustomerName"],
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.sp),
                                                    ),
                                                    subtitle: Text(
                                                      "Date: " +
                                                          dateTime.day
                                                              .toString() +
                                                          "/" +
                                                          dateTime.month
                                                              .toString() +
                                                          "/" +
                                                          dateTime.year
                                                              .toString(),
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    ),
                                                    trailing: Container(
                                                      height: 200.h,
                                                      width: 72.w,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 21.h,
                                                            width: 72.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ds["Payment"] ==
                                                                      "Paid"
                                                                  ? Color(
                                                                      0xFFC5FFDF)
                                                                  : ds["Payment"] ==
                                                                          "Not Paid"
                                                                      ? Color(
                                                                          0xFFFFF1C9)
                                                                      : ds["Payment"] ==
                                                                              "Not Qualified"
                                                                          ? Color(
                                                                              0xFFFDEEEF)
                                                                          : Colors
                                                                              .white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          19.r)),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                ds["Payment"],
                                                                style: GoogleFonts.poppins(
                                                                    fontSize: ds["Payment"] == "Not Qualified" ? 8.sp : 12.sp,
                                                                    color: ds["Payment"] == "Paid"
                                                                        ? Color(0xFF199E54)
                                                                        : ds["Payment"] == "Not Paid"
                                                                            ? Color(0xFFFAB900)
                                                                            : Color(0xFFFA646A)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5.h),
                                                          Container(
                                                            height: 24.h,
                                                            width: 72.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ds["Lead"] ==
                                                                      "Lost"
                                                                  ? Color(
                                                                      0xFFFDEEEF)
                                                                  : ds["Lead"] ==
                                                                          "Sold"
                                                                      ? Color(
                                                                          0xFFECECEC)
                                                                      : Colors
                                                                          .white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          19.r)),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                  ds["Lead"],
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    fontSize: ds["Lead"] ==
                                                                            "Not Qualified"
                                                                        ? 9.sp
                                                                        : 12.sp,
                                                                    color: ds["Lead"] ==
                                                                            "Sold"
                                                                        ? Colors
                                                                            .black
                                                                        : Color(
                                                                            0xFFFA646A),
                                                                  )),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 25.h),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            }
                          }),
                    ),
                    SizedBox(height: 25.h),
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
