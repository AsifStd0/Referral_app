import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:refferalapp/UI/Screens/ReferralPartnerScreens/Email.dart';

import 'package:refferalapp/UI/style/colors.dart';
import 'package:refferalapp/main.dart';

import '../../common_widgets/cuctom_container/custom_container.dart';
import '../SignUp/sign_up.dart';
import 'EditRefferal.dart';

class EditRefferalDetails extends StatefulWidget {
  var snapshot;
  EditRefferalDetails({required this.snapshot});

  @override
  State<EditRefferalDetails> createState() => _SubmitNewRefferalsState();
}

class _SubmitNewRefferalsState extends State<EditRefferalDetails> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final refferral = Provider.of<EditRefferral>(context, listen: false);
    refferral.customerfulltName.text = widget.snapshot["CustomerName"];
    refferral.customerphoneNumber.text = widget.snapshot["CustomerPhone"];
    refferral.customeraddress.text = widget.snapshot["CustomerAddress"];
    refferral.customercompany.text = widget.snapshot["CustomerCompany"];
    refferral.customeremail.text = widget.snapshot["CustomerEmail"];
    refferral.customerlostDescription.text =
        widget.snapshot["DescriptionOfLoss"];

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
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
                          "Edit Your Details",
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                          ),
                        ),
                        Container(),
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
                        "Kindly Enter the Person Loss details below to submit the form",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Custome Full Name",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.customerfulltName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last Name ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g John Doe',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Customer Phone number",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: refferral.customerphoneNumber,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your PhoneNumer ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'e.g +1-(800)980-7654',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Customer Address",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.customeraddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'House#12, Street#09, New York USA',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Customer Email",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.customeremail,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value) ==
                                  false) {
                            return 'Please enter a valid email ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'johndoe@email.com',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Customers Company",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: refferral.customercompany,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Company ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Company...',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Customer Loss description",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 7,
                        controller: refferral.customerlostDescription,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter lost description ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: 'Enter here...',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFD8D4D4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFFD8D4D4),
                              // style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      Consumer<EditRefferral>(builder: (context, signUp1, _) {
                        return GestureDetector(
                          onTap: () async {
                            print(
                                'this is outer uid user ${widget.snapshot["uid"]} ');
                            log('this is inner uid user ${widget.snapshot.id} ');
                            if (signUp1.isLoading ==
                                false) if (_formKey.currentState!.validate()) {
                              String a = await signUp1.editRefferral(context,
                                  widget.snapshot.id, widget.snapshot["uid"]);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Color(0xFF22408F),
                                    content: Text(
                                        'Kindly Correct The Input Feilds')),
                              );
                            }
                          },
                          child: CustomContainer(
                            width: 382.w,
                            height: 66.h,
                            boarderRadius: 20.sp,
                            color: mainBlueColor,
                            widget: Center(
                              child: refferral.isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Text(
                                      "UPDATE DETAILS",
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      }),
                      // InkWell(
                      //   onTap: () {
                      //     Get.to(RefferalSubmittedScreen());
                      //   },
                      //   child: Container(
                      //     height: 66.h,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       color: Color(0xFF22408F),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey.withOpacity(0.2),
                      //           spreadRadius: 2,
                      //           blurRadius: 3,
                      //           offset:
                      //               Offset(0, 3), // changes position of shadow
                      //         ),
                      //       ],
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20.r)),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "DONE",
                      //         style: GoogleFonts.poppins(
                      //             color: Colors.white, fontSize: 20.sp),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
      ),
    );
  }
}
