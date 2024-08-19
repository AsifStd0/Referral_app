import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/model/appuser.dart';
import '../MyProfileScreens/ MyProfileScreen.dart';
import '../MyProfileScreens/EditProfile.dart';
import '../ReferralLeads/referral_leads_screen.dart';
import '../ReferralPartnerScreens/NewReferralPartnerScreen.dart';
import '../ReferralPartnerScreens/ReferralLeads.dart';
import '../SignIn/sign_in_screen.dart';
import '../SubmitNewRefferals/submitnew_refferal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      body: ListView(
        children: [
          Container(
            height: 62.h,
            width: width,
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
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(19.0),
                  bottomLeft: Radius.circular(19.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: ImageIcon(AssetImage("assets/menu.png"))),
                  Text(
                    "Restoration Services",
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
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leads",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Get.to(SubmitNewRefferals());
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(19.r)),
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
                            style:
                                GoogleFonts.poppins(color: Color(0xFF22408F)),
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
                InkWell(
                  onTap: () {
                    Get.to(ReferralLeadsScreen());
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(19.r)),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/ref.png",
                          height: 29.h,
                          width: 35.w,
                        ),
                        title: Text(
                          "Referral Leads",
                          style: GoogleFonts.poppins(),
                        ),
                        subtitle: Text(
                          "Previously Submitted leads",
                          style: GoogleFonts.poppins(),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF22408F),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  "Partners",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(19.r)),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/newreferralPartner.png",
                            height: 29.h,
                            width: 35.w,
                          ),
                          title: Text(
                            "New Referral Partner",
                            style:
                                GoogleFonts.poppins(color: Color(0xFF22408F)),
                          ),
                          subtitle: Text(
                            "Submit new Partner",
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
                GestureDetector(
                  onTap: () {
                    Get.to(() => PartnersReferralLeadsScreen());
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
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(19.r)),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/partners.png",
                          height: 29.h,
                          width: 35.w,
                        ),
                        title: Text(
                          "Referral Partners",
                          style: GoogleFonts.poppins(fontSize: 17.sp),
                        ),
                        subtitle: Text(
                          "View all referred Partners list",
                          style: GoogleFonts.poppins(fontSize: 12.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF22408F),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
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
            ),
            height: 278.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 109.h,
                    width: 109.w,
                    child: Image.asset(
                      user!.avatar!,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 15.8.h),
                Text(
                  user!.firstName! + ' ' + user!.lastName!,
                  style: GoogleFonts.poppins(
                      fontSize: 22.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2.h),
                Text(
                  user!.phoneNumber!,
                  style: GoogleFonts.poppins(
                      fontSize: 17.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: () {
              Get.to(() => MyProfileScreen());
            },
            child: Row(
              children: [
                SizedBox(width: 24.w),
                Image.asset(
                  "assets/Icon awesome-user-circle-1.png",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 19.w),
                Text(
                  "My Profile",
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              Get.to(() => ReferralLeadsScreen());
            },
            child: Row(
              children: [
                SizedBox(width: 24.w),
                Image.asset(
                  "assets/Icon awesome-users.png",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 19.w),
                Text(
                  "Referral Customers",
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              Get.to(() => PartnersReferralLeadsScreen());
            },
            child: Row(
              children: [
                SizedBox(width: 24.w),
                Image.asset(
                  "assets/Icon awesome-users.png",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 19.w),
                Text(
                  "Referral Partners",
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Spacer(),
          InkWell(
            onTap: () async {
              SharedPreferences shared;
              shared = await SharedPreferences.getInstance();
              // shared.clear();
              shared.setBool('isalready', false);
              // bool? isalready = shared!.getBool('isalready') ?? false;
              // await FirebaseAuth.instance.signOut();
              Get.offAll(SignInScreen());
            },
            child: Row(
              children: [
                SizedBox(width: 24.w),
                Image.asset(
                  "assets/logout.png",
                  height: 14.h,
                  width: 16.w,
                  color: Color(0xFF707070),
                ),
                SizedBox(width: 19.w),
                Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF707070)),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
