import 'package:flutter/material.dart';
import 'package:mvvm/Respository/auth_repository.dart';
import 'package:mvvm/Utils/routes/routes.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/View_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../Model/user_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();

  Future<dynamic> loginApi(var data, BuildContext context) async {
    _myrepo.loginApi(data).then((value) {
      final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
      userPrefrences.saveUser(UserModel(token: value['token'].toString()));
      Utils().flushBarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utils().flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<dynamic> signUpApi(var data, BuildContext context) async {
    _myrepo.registerApi(data).then((value) {
      Utils().flushBarErrorMessage('Signup Successful', context);
            Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utils().flushBarErrorMessage(error.toString(), context);
    });
  }
}
