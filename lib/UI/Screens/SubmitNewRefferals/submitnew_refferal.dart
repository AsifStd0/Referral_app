import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/SubmitNewRefferals/refferalsubmitted_screen.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:uuid/uuid.dart';

import '../RestorationForm/restoration_lost.dart';
import '../SplashScreen/splash_screen.dart';
import 'package:http/http.dart' as http;

class SubmitRefferal with ChangeNotifier {
  TextEditingController customerfirsttName = TextEditingController();
  TextEditingController customerlasttName = TextEditingController();
  TextEditingController customerlostDescription = TextEditingController();
  TextEditingController customeraddress = TextEditingController();
  TextEditingController customerphoneNumber = TextEditingController();
  TextEditingController customercompany = TextEditingController();
  TextEditingController customeremail = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();

  bool isLoading = false;
  sendSms(String? accountid, String? authtoken, String? twilionumber) async {
    try {
      late TwilioFlutter twilioFlutter;
      twilioFlutter = TwilioFlutter(
          accountSid: accountid.toString(),
          // "AC00734aa99666985887dd97443033e759",
          authToken: authtoken.toString(),
          // "2c029b5d824ae7de0401f8100bff967c",
          twilioNumber: twilionumber.toString()

          //  "+18158932679"

          );
      for (int i = 0; i < numbers.length; i++) {
        await twilioFlutter.sendSMS(
            toNumber: numbers[i],
            messageBody: "NEW LEAD"
                    "\n"
                    "\n"
                    "\n"
                    "New Referral Received"
                    "\n"
                    " ${DateTime.now().month.toString() + "/" + DateTime.now().day.toString() + "/" + DateTime.now().year.toString()}"
                    "\n"
                    "\n"
                    "\n"
                    "\n"
                    "CUSTOMER DETAILS"
                    "\n"
                    "\n"
                    "NAME: ${customerfirsttName.text + " " + customerlasttName.text}"
                    "\n"
                    "\n"
                    "ADDRESS: ${customeraddress.text + " " + city.text + " " + state.text + " " + zip.text}"
                    "\n"
                    "\n"
                    "PHONE: ${customerphoneNumber.text}"
                    "\n"
                    "\n"
                    "COMPANY: ${customercompany.text}"
                    "\n"
                    "\n"
                    "EMAIL:" +
                "${customeremail.text.toString()}"
                    "\n"
                    "\n"
                    "Loss Description: ${customerlostDescription.text}"
                    "\n"
                    "\n"
                    "\n"
                    "\n"
                    "REFERRAL PERSON'S DETAILS"
                    "\n"
                    "\n"
                    "NAME: ${user!.firstName! + " " + user!.lastName!}"
                    "\n"
                    "\n"
                    "PHONE: ${user!.phoneNumber!}"
                    "\n"
                    "\n"
                    "COMPANY: ${user!.company!}"
                    "\n"
                    "\n"
                    "EMAIL: ${user!.email!.toString()}");
      }

      // print("phone numbers  >>>>>>>>>>>>>> ${phone[i]}");

      // ignore: nullable_type_in_catch_clause
    } on TwilioFlutter catch (e) {
      print("sms erorrrrrrrrrrrrrrrrrrrrrrrrrrr ${e.toString()}");
    }
  }

  sendEmail() async {
    final serviceId = "service_lnluuzm";
    final templateId = "template_zdqbzon";
    final userId = "PKpVr2NVyCvnT0ZD5";
    log(emails.toString());
    var response;
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    for (int i = 0; i < emails.length; i++)
      response = await http.post(url,
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
                "reply_to": "servicerestorationpro@gmail",
                "main_heading": "NEW LEAD",

                "date_time":
                    "   ${DateTime.now().month.toString() + "/" + DateTime.now().day.toString() + "/" + DateTime.now().year.toString()}",

                "customer_name":
                    "${customerfirsttName.text + " " + customerlasttName.text}",

                "cusotmer_address":
                    "${customeraddress.text + " " + city.text + " " + state.text + " " + zip.text}",

                "customer_phone": "${customerphoneNumber.text}",

                "customer_company": "${customercompany.text}",

                "customer_email": "${customeremail.text.toString()}",

                "loss_description": "${customerlostDescription.text}",

                "Secondaryheading3": "REFERRAL PERSON'S DETAILS",

                "name": "${user!.firstName! + " " + user!.lastName!}",

                "phone": "${user!.phoneNumber!}",

                "company": "${user!.company!}",

                "email": "${user!.email!.toString()}"
              }
            },
          ));
    log("This is email");
  }

  sendemail2() async {
    final serviceId = "service_lnluuzm";
    final templateId = "template_zdqbzon";
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
                "main_heading": "NEW LEAD",

                "date_time":
                    "   ${DateTime.now().month.toString() + "/" + DateTime.now().day.toString() + "/" + DateTime.now().year.toString()}",

                "customer_name":
                    "${customerfirsttName.text.toString() + " " + customerlasttName.text.toString()}",

                "customer_address":
                    "${customeraddress.text + " " + city.text + " " + state.text + " " + zip.text}",

                "customer_phone": "${customerphoneNumber.text.toString()}",

                "customer_company": "${customercompany.text.toString()}",

                "customer_email": "${customeremail.text.toString()}",

                "loss_description":
                    "${customerlostDescription.text.toString()}",

                "name": "${user!.firstName! + " " + user!.lastName!}",

                "phone": "${user!.phoneNumber!}",

                "company": "${user!.company!}",

                "email": "${user!.email!.toString()}"
              }
            },
          ));
  }

  Future<String> submitRefferal(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      // FirebaseAuth auth = FirebaseAuth.instance;

      // var uuid = Uuid();
      // String uid = uuid.v1();

      SharedPreferences? shared = await SharedPreferences.getInstance();

      String? uid = shared.getString('uid');

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Refferals")
          .add({
        "CustomerName": customerfirsttName.text + " " + customerlasttName.text,
        "DescriptionOfLoss": customerlostDescription.text,
        "CustomerAddress": customeraddress.text +
            " " +
            city.text +
            " " +
            state.text +
            " " +
            zip.text,
        "CustomerPhone": customerphoneNumber.text,
        "CustomerCompany": customercompany.text,
        "CustomerEmail": customeremail.text,
        "DateTime": DateTime.now(),
        "JobNumber": "0",
        "InvoicedAmount": 0,
        "uid": uid,
        "Payment": "",
        "Lead": ""
      });
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
      isLoading = false;
      notifyListeners();

      Get.offAll(RefferalSubmittedScreen());
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
