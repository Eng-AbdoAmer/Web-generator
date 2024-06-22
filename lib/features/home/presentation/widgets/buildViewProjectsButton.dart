import 'package:flutter/material.dart';
import 'package:landingagea/core/constant/app_colors.dart';

import '../../../../core/constant/styles_manager.dart';

class BuildProjectsButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const BuildProjectsButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: AppColors.darkBlue,
        onPressed: onPressed,
        child: Text(
          title,
          style: getBoldStyle(color: AppColors.white, fontSize: 18),
        ));
  }
}
