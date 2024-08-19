import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/UI/Screens/SubmitNewRefferals/refferalsubmitted_screen.dart';
import 'package:refferalapp/UI/Screens/SubmitNewRefferals/refferralUpdated.dart';
import 'package:refferalapp/core/model/appuser.dart';

import '../RestorationForm/restoration_lost.dart';

class EditRefferral with ChangeNotifier {
  TextEditingController customerfulltName = TextEditingController();
  TextEditingController customerlostDescription = TextEditingController();
  TextEditingController customeraddress = TextEditingController();
  TextEditingController customerphoneNumber = TextEditingController();
  TextEditingController customercompany = TextEditingController();
  TextEditingController customeremail = TextEditingController();

  bool isLoading = false;

  Future<String> editRefferral(
      BuildContext context, String docId, String currentUserID) async {
    try {
      isLoading = true;
      notifyListeners();
      FirebaseAuth auth = FirebaseAuth.instance;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUserID)
          .collection("Refferals")
          .doc(docId)
          .update({
        "CustomerName": customerfulltName.text,
        "DescriptionOfLoss": customerlostDescription.text,
        "CustomerAddress": customeraddress.text,
        "CustomerPhone": customerphoneNumber.text,
        "CustomerCompany": customercompany.text,
        "CustomerEmail": customeremail.text,
      });

      isLoading = false;
      notifyListeners();
      Get.offAll(RefferalUpdated());
      customerfulltName.clear();
      customercompany.clear();
      customeraddress.clear();
      customeremail.clear();
      customerlostDescription.clear();
      customerphoneNumber.clear();

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
