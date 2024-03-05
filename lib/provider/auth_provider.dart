import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _username = "";
  String _password = "";
  String _email = "";

  void updateUserName(String userName) {
    _username = userName;
    notifyListeners();
  }
  void updatePassWord(String passWord) {
    _password = passWord;
    notifyListeners();
  }
  void updateEmail(String email) {
    _email = email;
    notifyListeners();
  }

  String get username => _username;

  String get password => _password;

  String get email => _email;
}