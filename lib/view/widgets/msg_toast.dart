import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showBoatToast({required String msg, Color? bg}) {
  Fluttertoast.showToast(
      textColor: whiteColor,
      msg: msg,
      fontSize: 16,
      timeInSecForIosWeb: 3,
      backgroundColor: bg ?? greyColor,
      webBgColor: greyColor,
      webPosition: 'right',
      webShowClose: true,
      gravity: ToastGravity.SNACKBAR);
}
