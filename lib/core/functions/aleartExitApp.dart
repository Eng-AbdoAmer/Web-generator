import 'dart:io';

import 'package:flutter/material.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

Future<bool> alertExitApp(BuildContext context) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.error,
    body: Center(
      child: Text(
        'would you like close this application',
      ),
    ),
    title: 'This is Error',
    desc: 'would you like to close this application',
    btnOkOnPress: () {
      exit(0);
    },
  )..show();
  // appDialog(
  //     title: "Alert Dialog",
  //     subtitle: "would you like close this application",
  //     click: "ok",
  //     onPressedOKClick: () {
  //       exit(0);
  //     });
  return Future.value(true);
}
