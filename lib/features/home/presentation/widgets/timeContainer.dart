import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/styles_manager.dart';

class TimeContainer extends StatelessWidget {
  final String title, des;
  const TimeContainer({super.key, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Text(
            title,
            style: getBoldStyle(color: AppColors.black),
          ),
          Text(des, style: getBoldStyle(color: AppColors.grey2))
        ],
      ),
    );
  }
}
//cubit.cardList[i]['duedate']!
//cubit.cardList[i]['date']!