import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/styles_manager.dart';

class OptionsCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final void Function() onTap;
  const OptionsCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: AppColors.primaryColor),
      ),
      child: ListTile(
        onTap: onTap,
        minLeadingWidth: 40,
        leading: Icon(
          color: AppColors.primaryColor,
          icon,
          size: 35,
        ),
        title: Text(title,
            style: getBoldStyle(color: AppColors.primaryColor, fontSize: 16)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
