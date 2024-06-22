import 'package:flutter/material.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/constant/styles_manager.dart';

class ActiveProjectsCard extends StatelessWidget {
  const ActiveProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          color: AppColors.darkBlue, borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("69", style: getBoldStyle(color: AppColors.white, fontSize: 20)),
        Text("Active Project",
            style: getBoldStyle(color: AppColors.white, fontSize: 20)),
        space(20, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("43 Pending Project",
                style: getMediumStyle(color: AppColors.white, fontSize: 18)),
            Text(
              "72%",
              style: getMediumStyle(color: AppColors.white, fontSize: 18),
            ),
          ],
        ),
        space(10, 0),
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1500,
          lineHeight: 25,
          percent: 0.70,
          progressColor: Colors.pink,
          barRadius: const Radius.circular(25),
          backgroundColor: AppColors.white,
        )
      ]),
    );
  }
}
