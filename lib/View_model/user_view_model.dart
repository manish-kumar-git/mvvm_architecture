import 'package:flutter/material.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String token = pref.getString('token').toString();
    notifyListeners();
    return UserModel(token: token);
  }

  Future<bool> removeUser(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear().then((value) => Navigator.pushNamed(context, RoutesName.login));

    return true;
  }
}
