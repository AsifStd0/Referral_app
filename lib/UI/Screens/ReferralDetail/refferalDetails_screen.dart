import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:refferalapp/main.dart';

import 'EditReferralDetailsScreen.dart';

class RefferralDetailsScreen extends StatefulWidget {
  var snapshot;
  RefferralDetailsScreen({required this.snapshot});

  @override
  State<RefferralDetailsScreen> createState() => _RefferralDetailsScreenState();
}

class _RefferralDetailsScreenState extends State<RefferralDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = widget.snapshot["DateTime"] as Timestamp;
    DateTime dateTime = timestamp.toDate();

    String formattedDate = DateFormat.yMMMEd().format(dateTime).toString();
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (() {
                            Get.back();
                          }),
                          child: Icon(Icons.arrow_back_ios)),
                      Text(
                        "Referral Details",
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        formattedDate,
                        // DateFormat.yMMMEd()
                        //     .format(DateTime.parse(widget.snapshot["DateTime"]))
                        //     .toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                        ),
                      ),
                      Container()
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Full Name",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["CustomerName"],
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Phone number",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["CustomerPhone"],
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Address",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["CustomerAddress"],
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Company",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["CustomerCompany"],
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["CustomerEmail"],
                      style: GoogleFonts.poppins(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Loss description...${widget.snapshot["CustomerEmail"]}",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, color: Color(0xFF707070)),
                    ),
                    Text(
                      widget.snapshot["DescriptionOfLoss"],
                      style: GoogleFonts.poppins(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Payment Status",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF707070), fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 58.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: widget.snapshot["Payment"] == "Paid"
                                        ? Color(0xFFC5FFDF)
                                        : widget.snapshot["Payment"] ==
                                                "Not Paid"
                                            ? Color(0xFFFFF1C9)
                                            : widget.snapshot["Payment"] ==
                                                    "Not Qualified"
                                                ? Color(0xFFFDEEEF)
                                                : Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.snapshot["Payment"],
                                      style: GoogleFonts.poppins(
                                          color: widget.snapshot["Payment"] ==
                                                  "Paid"
                                              ? Color(0xFF199E54)
                                              : widget.snapshot["Payment"] ==
                                                      "Not Paid"
                                                  ? Color(0xFFFAB900)
                                                  : Color(0xFFFA646A),
                                          fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Lead Status",
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF707070), fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 58.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: widget.snapshot["Lead"] == "Lost"
                                        ? Color(0xFFFDEEEF)
                                        : widget.snapshot["Lead"] == "Sold"
                                            ? Color(0xFFECECEC)
                                            : Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.snapshot["Lead"],
                                      style: GoogleFonts.poppins(
                                          color:
                                              widget.snapshot["Lead"] == "Sold"
                                                  ? Colors.black
                                                  : Color(0xFFFA646A),
                                          fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40.h),
                    InkWell(
                      onTap: () {
                        Get.to(() => EditRefferalDetails(
                              snapshot: widget.snapshot,
                            ));
                      },
                      child: Container(
                        height: 66.h,
                        width: double.infinity,
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
                          border: Border.all(color: Color(0xFF22408F)),
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        child: Center(
                          child: Text(
                            "Edit Referral Details",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF22408F), fontSize: 20.sp),
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
