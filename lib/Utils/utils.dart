import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  toastmessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.blueGrey);
  }

  flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          showProgressIndicator: true,
          duration: Duration(seconds: 3),
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        )..show(context));
  }
}
