import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../constant/app_colors.dart';

//TODO: must be put navigatorKey in main under MaterialApp
final navigatorKey = GlobalKey<NavigatorState>();
//////////////////////////////////////////////////////////////
Future navigateTo({required page, withHistory = true}) {
  return Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => page), (route) => withHistory);
}

showToast({required String msg, bool isError = true}) {
  // bool isError = false;
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Text(msg,
        style: TextStyle(
            color: isError ? AppColors.white : AppColors.black, fontSize: 18)),
    backgroundColor: isError ? AppColors.red : AppColors.green,
  ));
}

AppDialog(BuildContext context, String name, String value) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: name,
    desc: value,
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: false,
    btnCancelOnPress: () {},
    btnOkOnPress: () {},
  ).show();
}
