import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/HomeScreen/HomeScreen.dart';
import 'package:refferalapp/UI/Screens/RestorationForm/restoration_lost2.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:uuid/uuid.dart';

import '../ReferralPartnerScreens/NewReferralPartnerScreen.dart';
import '../RestorationForm/restoration_lost.dart';
import '../SplashScreen/splash_screen.dart';
import 'package:http/http.dart' as http;

class SignUp with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lasteName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController jobTittle = TextEditingController();
  String w9Form = "No I have not completed it";
  bool isLoading = false;
  String avatar = avatarList[0];
  SharedPreferences? shared;
  List<String> Email = [];
  updateW9(String value) {
    w9Form = value;
    notifyListeners();
  }

  sendSms(String? accountid, String? authtoken, String? twilionumber) async {
    try {
      for (int i = 0; i < numbers.length; i++) {
        late TwilioFlutter twilioFlutter;
        twilioFlutter = TwilioFlutter(
          accountSid: accountid.toString(),
          // 'AC23c02ac50f26142012e38b1ea9d8ce06',
          // "AC00734aa99666985887dd97443033e759",
          authToken: authtoken.toString(),
          //  '8d579e18c4586d0da1475d47b2bd5a14',
          // "2c029b5d824ae7de0401f8100bff967c",
          twilioNumber: twilionumber.toString(),
          //  '+19784516006',
          // "+18158932679"
        );
        await twilioFlutter.sendSMS(
            toNumber: numbers[i],
            messageBody: "NEW REFERRAL PARTNER"
                    "\n"
                    "\n"
                    "\n"
                    "New Referral partner"
                    "\n"
                    "\n"
                    "NAME: ${firstName.text + " " + lasteName.text}"
                    //"Building Name: ${widget.currentBuilding.buildingName.toString()}"
                    // "\n"
                    // "Building Address: ${widget.currentBuilding.streetAddress.toString()},"
                    "\n"
                    "\n"
                    "ADDRESS: ${address.text + " " + city.text + " " + state.text + " " + zip.text}"
                    "\n"
                    "\n"
                    "PHONE: ${phoneNumber.text}"
                    "\n"
                    "\n"
                    "COMPANY: ${company.text}"
                    "\n"
                    "\n"
                    "EMAIL:" +
                "${email.text.toString()}"
                    "\n"
                    "\n"
                    "W9 Form: $w9Form");
      }
      // print("phone numbers  >>>>>>>>>>>>>> ${phone[i]}");

      // ignore: nullable_type_in_catch_clause
    } on TwilioFlutter catch (e) {
      print("sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
    }
  }

  setAvatar(String value) {
    avatar = value;
    notifyListeners();
  }

  sendemail2() async {
    final serviceId = "service_lnluuzm";
    final templateId = "template_spifaze";
    final userId = "PKpVr2NVyCvnT0ZD5";
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    for (int i = 0; i < emails.length; i++)
      final response = await http.post(url,
          headers: {
            "origin": "http://localhost",
            "Content-Type": "application/json"
          },
          body: json.encode(
            {
              "service_id": serviceId,
              "template_id": templateId,
              "user_id": userId,
              "template_params": {
                // "from_email": fromEmail,
                "to_email": emails[i],
                "reply_to": "arbabshujaat8@gmail.com",
                "main_heading": "NEW REFERRAL PARTNER",

                "user_name": "${firstName.text + " " + lasteName.text}",

                "user_address":
                    "${address.text + " " + city.text + " " + state.text + " " + zip.text}",

                "user_phone": "${phoneNumber.text}",

                "user_company": "${company.text}",

                "user_email": "${email.text.toString()}",

                "user_form": "$w9Form"
              }
            },
          ));
  }

  Future<String> signupUser(BuildContext context) async {
    try {
      var uuid = Uuid();
      String uid = uuid.v1().toString();
      isLoading = true;
      notifyListeners();

      // FirebaseAuth auth = FirebaseAuth.instance;

      // await auth.createUserWithEmailAndPassword(
      //     email: email.text, password: "asd1234");

      final snapshot =
          await FirebaseFirestore.instance.collection("Users").get();
      if (snapshot.docs.length > 0) {
        for (int i = 0; i < snapshot.docs.length; i++) {
          log('#############################');
          log('${snapshot.docs[i].data()['Email']}');
          Email.add(snapshot.docs[i].data()['Email']);
        }
        if (Email.contains(email.text.trim().toLowerCase())) {
          Get.snackbar('Error', 'email already registered');
          isLoading = false;
          notifyListeners();
        } else {
          await FirebaseFirestore.instance.collection("Users").doc(uid).set({
            "RefderedBy": "Self",
            "RefderedByName": "Self",
            "password": password.text.toString().toLowerCase(),
            "EmailVerified": false,
            "W9Form": w9Form == "No I have not completed it" ? false : true,
            "FirstName": firstName.text.toLowerCase(),
            "LastName": lasteName.text.toLowerCase(),
            "DateTime": DateTime.now(),
            "Verified": false,
            "Udid": uid,
            "IsAdmin": false,
            "city": city.text,
            "Address": address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            "Phone": phoneNumber.text.toLowerCase(),
            "CompanyName": company.text.toLowerCase(),
            "Email": email.text.toLowerCase(),
            "AvgJobValue": 0,
            "Refferals": 0,
            "Accepted": "Pending",
            "Avatar": avatar,
            "JobTittle": jobTittle.text.toLowerCase(),
            "Password": password.text
          });

          user = AppUser(
            address: address.text +
                " " +
                city.text +
                " " +
                state.text +
                " " +
                zip.text,
            w9Form: w9Form == "No I have not completed it" ? false : true,
            company: company.text,
            email: email.text,
            firstName: firstName.text,
            lastName: lasteName.text,
            phoneNumber: phoneNumber.text,
            udid: uid,
            accepted: "Pending",
            password: password.text,
            avatar: avatar,
            jobTittle: jobTittle.text,
            verified: false,
            avgJobValue: 0,
            refferals: 0,
          );

          var checkTrilio =
              await FirebaseFirestore.instance.collection("trilio").get();
          String? accountid = checkTrilio.docs.first.data()['accountid'];
          String? authtoken = checkTrilio.docs.first.data()['authtoken'];
          String? twilionumber = checkTrilio.docs.first.data()['twilionumber'];
          if (checkTrilio.docs.first.data()['checkTrilio'] == true) {
            await sendSms(accountid, authtoken, twilionumber);
          }
          print(
              "phone numbers  >>>>>>>>>>>>>> ${accountid} ${authtoken} ${twilionumber}");

          await sendemail2();
          isLoading = false;
          notifyListeners();
          shared = await SharedPreferences.getInstance();
          shared!.setBool('isalready', true);
          shared!.setString('uid', uid);
          // Get.offAll(RestorationLostFrom());
          user!.accepted != "Accepted"
              ? Get.offAll(RestorationLostFrom2())
              : Get.offAll(HomeScreen());
        }
      } else {
        await FirebaseFirestore.instance.collection("Users").doc(uid).set({
          "RefderedBy": "Self",
          "RefderedByName": "Self",
          "password": password.text.toString(),
          "EmailVerified": false,
          "W9Form": w9Form == "No I have not completed it" ? false : true,
          "FirstName": firstName.text,
          "LastName": lasteName.text,
          "DateTime": DateTime.now(),
          "Verified": false,
          "Udid": uid,
          "Address": address.text +
              " " +
              city.text +
              " " +
              state.text +
              " " +
              zip.text,
          "IsAdmin": false,
          "city": city.text,
          "Phone": phoneNumber.text,
          "CompanyName": company.text,
          "Email": email.text,
          "AvgJobValue": 0,
          "Refferals": 0,
          "Accepted": "Pending",
          "Avatar": avatar,
          "JobTittle": jobTittle.text,
          "Password": password.text
        });

        user = AppUser(
          address: address.text +
              " " +
              city.text +
              " " +
              state.text +
              " " +
              zip.text,
          w9Form: w9Form == "No I have not completed it" ? false : true,
          company: company.text,
          email: email.text,
          firstName: firstName.text,
          lastName: lasteName.text,
          phoneNumber: phoneNumber.text,
          udid: uid,
          accepted: "Pending",
          password: password.text,
          avatar: avatar,
          jobTittle: jobTittle.text,
          verified: false,
          avgJobValue: 0,
          refferals: 0,
        );
        var checkTrilio =
            await FirebaseFirestore.instance.collection("trilio").get();
        String? accountid = checkTrilio.docs.first.data()['accountid'];
        String? authtoken = checkTrilio.docs.first.data()['authtoken'];
        String? twilionumber = checkTrilio.docs.first.data()['twilionumber'];
        if (checkTrilio.docs.first.data()['checkTrilio'] == true) {
          await sendSms(accountid, authtoken, twilionumber);
        }

        // await sendSms();
        await sendemail2();
        isLoading = false;
        notifyListeners();
        shared = await SharedPreferences.getInstance();
        shared!.setBool('isalready', true);
        shared!.setString('uid', uid);
        // Get.offAll(RestorationLostFrom());
        user!.accepted != "Accepted"
            ? Get.offAll(RestorationLostFrom2())
            : Get.offAll(HomeScreen());
      }

      return "Success";
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Error",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(e.toString()),
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
      return e.toString();
    }
  }
}
