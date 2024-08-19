import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:uuid/uuid.dart';

import '../RestorationForm/refferralPartnerSubmitted.dart';
import '../RestorationForm/restoration_lost.dart';
import '../SplashScreen/splash_screen.dart';
import 'NewReferralPartnerScreen.dart';
import 'package:http/http.dart' as http;

class NewRefferalPartner with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController jobtittle = TextEditingController();

  String w9Form = "No I have not completed it";
  bool isLoading = false;

  String avatar = avatarList[0];
  int selectedAvatarIndex = 0;

  updateW9(String value) {
    w9Form = value;
    notifyListeners();
  }

  setAvatar(String value, int index) {
    avatar = value;
    selectedAvatarIndex = index;
    notifyListeners();
  }

  sendSms(String? accountid, String? authtoken, String? twilionumber) async {
    try {
      for (int i = 0; i < numbers.length; i++) {
        late TwilioFlutter twilioFlutter;
        twilioFlutter = TwilioFlutter(
            accountSid: accountid.toString(),
            // "AC00734aa99666985887dd97443033e759",
            authToken: authtoken.toString(),
            // "2c029b5d824ae7de0401f8100bff967c",
            twilioNumber: twilionumber.toString()
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
                    "NAME: ${firstName.text + " " + lastName.text}"
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

  sendSmstonewUser(
      String? accountid, String? authtoken, String? twilionumber) async {
    try {
      late TwilioFlutter twilioFlutter;
      twilioFlutter = TwilioFlutter(
          accountSid: accountid.toString(),
          // "AC00734aa99666985887dd97443033e759",
          authToken: authtoken.toString(),
          // "2c029b5d824ae7de0401f8100bff967c",
          twilioNumber: twilionumber.toString()
          // "+18158932679"

          );
      log("Hiiiiiii");
      log(phoneNumber.text.toString());
      await twilioFlutter.sendSMS(
          toNumber: phoneNumber.text.toString(),
          messageBody: "NEW REFERRAL PARTNER"
                  "\n"
                  "\n"
                  "\n"
                  "You have been added as  Referral partner on Referral App."
                  "\n"
                  "\n"
                  "Your credentials are"
                  "\n"
                  "\n"
                  "EMAIL:" +
              "${email.text.toString()}"
                  "\n"
                  "PASSWORD: 123456");

      // print("phone numbers  >>>>>>>>>>>>>> ${phone[i]}");

      // ignore: nullable_type_in_catch_clause
    } on TwilioFlutter catch (e) {
      print("sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
    }
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

                "user_name": "${firstName.text + " " + lastName.text}",

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

  sendemailtouser() async {
    final serviceId = "service_lnluuzm";
    final templateId = "template_e4y9rnw";
    final userId = "PKpVr2NVyCvnT0ZD5";
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

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
              "to_email": email.text.toString(),
              "reply_to": "arbabshujaat8@gmail.com",
              "main_heading": "NEW REFERRAL PARTNER",

              "email": email.text.toString(),
            }
          },
        ));

    log("hiiiii");
    log(response.toString());
  }

  Future<String> signupUser(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseAuth auth = FirebaseAuth.instance;
      log('this is databse function ------------------------------------>>>>>>>>>>');
      // await auth.createUserWithEmailAndPassword(
      //     email: email.text, password: "123456");

      // await auth.currentUser!.sendEmailVerification();
      var uuid = Uuid();
      String uid = uuid.v1();
      await FirebaseFirestore.instance.collection("Users").doc(uid).set({
        "RefderedBy": user!.udid,
        "RefderedByName": user!.firstName! + " " + user!.lastName!,
        "EmailVerified": false,
        "W9Form": w9Form == "No I have not completed it" ? false : true,
        "FirstName": firstName.text,
        "LastName": lastName.text,
        "Verified": false,
        "Udid": uid,
        "IsAdmin": false,
        "city": city.text,
        "Address":
            address.text + " " + city.text + " " + state.text + " " + zip.text,
        "Phone": phoneNumber.text,
        "DateTime": DateTime.now(),
        "CompanyName": company.text,
        "Email": email.text,
        "Password": "123456",
        "AvgJobValue": 0,
        "Refferals": 0,
        "Accepted": "Pending",
        "Avatar": avatar,
        "JobTittle": jobtittle.text
      });

      // await auth.signOut();

      // await auth.signInWithEmailAndPassword(
      //     email: user!.email!, password: user!.password!);
      // await sendSms();

      var checkTrilio =
          await FirebaseFirestore.instance.collection("trilio").get();
      String? accountid = checkTrilio.docs.first.data()['accountid'];
      String? authtoken = checkTrilio.docs.first.data()['authtoken'];
      String? twilionumber = checkTrilio.docs.first.data()['twilionumber'];
      if (checkTrilio.docs.first.data()['checkTrilio'] == true) {
        await sendSms(accountid, authtoken, twilionumber);
      }


      await sendemail2();
      // await sendemailtouser();
      // await sendSmstonewUser();
      isLoading = false;
      notifyListeners();
      Get.to(RefferralPartnerCreated());

      return "Success";
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log(e.toString());
      if (e.toString() == "Exception") Get.to(RefferralPartnerCreated());
      if (e.toString() != "Exception")
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Error....",
                style: TextStyle(color: Colors.red),
              ),
              content: Text('...... ${e.toString()}'),
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
