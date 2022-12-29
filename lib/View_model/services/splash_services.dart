import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/View_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuth(BuildContext context) {
    getUserData().then((value) async {
      print(value.token.toString());
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
