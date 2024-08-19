import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  String password = '';
  String confirmpassword = '';
  bool isload = false;
}
