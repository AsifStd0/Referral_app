import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refferalapp/UI/Screens/ReferralPartnerScreens/NewReferralPartnerScreen.dart';
import 'package:refferalapp/main.dart';
import '../../../Constants/ImageAssets.dart';
import '../../../core/model/appuser.dart';
import '../HomeScreen/HomeScreen.dart';

class PartnersReferralLeadsScreen extends StatefulWidget {
  const PartnersReferralLeadsScreen({super.key});

  @override
  State<PartnersReferralLeadsScreen> createState() =>
      _PartnersReferralLeadsScreen();
}

class _PartnersReferralLeadsScreen extends State<PartnersReferralLeadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SafeArea(
          child: Column(
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
                        "Referral Partners",
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
                          Get.to(() => NewReferralPartnerScreen());
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(19.r)),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Image.asset(
                                  newreferralPartner,
                                  height: 29.h,
                                  width: 35.w,
                                ),
                                title: Text(
                                  "New Referral Partner",
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
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Users")
                              .where("RefderedBy", isEqualTo: user!.udid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 0.6.sh,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    DocumentSnapshot ds =
                                        snapshot.data!.docs[index];
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(19.r)),
                                        ),
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 30.r,
                                            backgroundImage:
                                                AssetImage(ds["Avatar"]),
                                          ),
                                          title: Text(
                                            ds["FirstName"] +
                                                " " +
                                                ds["LastName"],
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                          subtitle: Text(
                                            "Job: " + ds["JobTittle"],
                                            style: GoogleFonts.poppins(),
                                          ),
                                          trailing: Text(
                                            ds["Accepted"] == "Accepted"
                                                ? "Accepted"
                                                : ds["Accepted"] == "Rejected"
                                                    ? "Denied"
                                                    : "Pending",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16.sp,
                                              color: ds["Accepted"] ==
                                                      "Accepted"
                                                  ? Color(0xFF0BAF10)
                                                  : ds["Accepted"] == "Rejected"
                                                      ? Colors.red
                                                      : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
