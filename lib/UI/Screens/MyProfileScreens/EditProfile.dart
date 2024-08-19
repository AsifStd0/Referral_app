import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../RestorationForm/restoration_lost.dart';

class EditProfile with ChangeNotifier {
  TextEditingController firstName =
      TextEditingController(text: user!.firstName);
  TextEditingController lasteName = TextEditingController(text: user!.lastName);
  TextEditingController address = TextEditingController(text: user!.address);
  TextEditingController phoneNumber =
      TextEditingController(text: user!.phoneNumber);
  TextEditingController company = TextEditingController(text: user!.company);

  String w9Form = "No I have not completed it";
  bool isLoading = false;
  SharedPreferences? shared;
  updateW9(String value) {
    w9Form = value;
    notifyListeners();
  }

  Future<String> EditProfileUser(BuildContext context) async {
    try {
      shared = await SharedPreferences.getInstance();
      shared!.setBool('isalready', true);
      String? uid = shared!.getString(
        'uid',
      );
      isLoading = true;
      notifyListeners();
      //FirebaseAuth auth = FirebaseAuth.instance;
      print('some is here');
      // print('this is uid ${auth.currentUser!.uid}');
      await FirebaseFirestore.instance.collection("Users").doc(uid).update({
        "RefderedBy": "Self",
        "EmailVerified": false,
        "W9Form": w9Form == "No I have not completed it" ? false : true,
        "FirstName": firstName.text,
        "LastName": lasteName.text,
        "Verified": false,
        "Udid": uid,
        "Address": address.text,
        "Phone": phoneNumber.text,
        "CompanyName": company.text,
      });

      user = AppUser(
          address: address.text,
          w9Form: w9Form == "No I have not completed it" ? false : true,
          company: company.text,
          email: user!.email,
          accepted: user!.accepted,
          avatar: user!.avatar,
          jobTittle: user!.jobTittle,
          firstName: firstName.text,
          lastName: lasteName.text,
          password: user!.password,
          phoneNumber: phoneNumber.text,
          udid: uid,
          verified: false,
          avgJobValue: user!.avgJobValue,
          refferals: user!.refferals);
      log(user!.avgJobValue.toString());

      isLoading = false;
      notifyListeners();
      Get.back();
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
