import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/ForgotPassword/otp_screen/otp_screen.dart';

class ForgotPasswordProvider1 extends ChangeNotifier {
  String email = '';
  ForgotPasswordProvider() {
    // getemail();
    email = '';
  }

  List<String> allEmail = [];
  bool isload = false;
  String udid = '';
  int? otp;
  getemail() async {
    isload = true;
    notifyListeners();
    print('this is get function');
    final snapshot = await FirebaseFirestore.instance.collection("Users").get();
    if (snapshot.docs.length >= 0) {
      for (int i = 0; i < snapshot.docs.length; i++) {
        print('#############################');
        if (snapshot.docs[i].data()['Email'] == email) {
          udid = snapshot.docs[i].data()['Udid'];
        }
        allEmail.add(snapshot.docs[i].data()['Email']);
      }
      print('this is before checkemail fucntion');
      checkEmail();
    }
  }

  checkEmail() {
    print('this is email $email');
    otp = Random().nextInt(900000) + 100000;
    sendemail();
    if (allEmail.contains(email)) {
      Get.to(() => OtpScreen(
            id: udid,
            otp: otp,
          ));
      email = '';
      isload = false;
      notifyListeners();
    } else if (email == '') {
      Get.snackbar(
          // backgroundColor: ,
          "Error",
          "Please enter email");
      isload = false;
      notifyListeners();
    } else {
      Get.snackbar(
          // backgroundColor: ,
          "Error",
          "Email is not registered");
      isload = false;
      notifyListeners();
    }
  }

  sendemail() async {
    final serviceId1 = "service_lnluuzm";
    final templateId1 = "template_ssf7msh";
    final userId1 = "PKpVr2NVyCvnT0ZD5";
    final url1 = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(url1,
        headers: {
          "origin": "http://localhost",
          "Content-Type": "application/json"
        },
        body: json.encode(
          {
            "service_id": serviceId1,
            "template_id": templateId1,
            "user_id": userId1,
            "template_params": {
              // "from_email": fromEmail,
              "to_email": email,
              "reply_to": "arbabshujaat8@gmail.com",
              "main_heading": "REFERRAL APP NOTIFICATION",
              "otp": otp.toString(),
            }
          },
        ));
  }
}
