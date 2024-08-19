import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/core/model/appuser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen/HomeScreen.dart';
import '../RestorationForm/restoration_lost2.dart';

class SignIn with ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  List<String> Email = [];
  SharedPreferences? shared;
  String UID = '';
  bool? Isverified;
  String passwordcheck = "";

  Future<String> signInpUser(BuildContext context) async {
    try {
      log('this si try area');
      isLoading = true;
      notifyListeners();
      FirebaseAuth auth = FirebaseAuth.instance;

      ///
      ///---->get all users from firebase
      ///
      final snapshot =
          await FirebaseFirestore.instance.collection("Users").get();
      if (snapshot.docs.length >= 0) {
        for (int i = 0; i < snapshot.docs.length; i++) {
          log('#############################');
          log('${snapshot.docs[i].data()['Email']}');
          if (email.text.trim().toLowerCase() ==
              snapshot.docs[i].data()['Email']) {
            UID = snapshot.docs[i].data()['Udid'];
            Isverified = snapshot.docs[i].data()['Verified'];
            passwordcheck = snapshot.docs[i].data()['Password'];
            log('this is uid of given user $UID');
            log('this is Isverified of given user $Isverified');
          }
          Email.add(snapshot.docs[i].data()['Email']);
        }
        if (Email.contains(email.text.trim().toLowerCase())) {
          if (passwordcheck != password.text.toLowerCase()) {
            print('wrong password enter');
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
                  content: Text("Inavlid Password"),
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
            return "";
          } else {
            log("Hiiiiiii");
            log('here is UID logic $UID');
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(UID)
                .get()
                .then((value) async {
              shared = await SharedPreferences.getInstance();
              shared!.setBool('isalready', true);
              shared!.setString('uid', UID);
              user = AppUser(
                  address: value["Address"],
                  company: value["CompanyName"],
                  email: value["Email"],
                  accepted: value["Accepted"],
                  avatar: value["Avatar"],
                  verified: value["Verified"],
                  udid: value["Udid"],
                  firstName: value["FirstName"],
                  lastName: value["LastName"],
                  phoneNumber: value["Phone"],
                  password: value["Password"],
                  w9Form: value["W9Form"],
                  refferals: value["Refferals"],
                  avgJobValue: value["AvgJobValue"],
                  jobTittle: value["JobTittle"]);
            });
            shared = await SharedPreferences.getInstance();
            shared!.setBool('isalready', true);
            shared!.setString('uid', UID);
            user!.accepted != "Accepted"
                ? Get.offAll(RestorationLostFrom2())
                : Get.offAll(HomeScreen());
          }
        } else {
          print('wrong email enter');
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
                content: Text("this email doesn't exite"),
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
          return "";
        }
      }
      isLoading = false;
      notifyListeners();

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
