import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/styles_manager.dart';
import '../../../../core/services/custom_sizebox.dart';

class CustomAuthRow extends StatelessWidget {
  final String name;
  final String description;
  final void Function()? onTap;
  const CustomAuthRow(
      {super.key, required this.name, required this.description, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Baseline(
          baseline: 20.0,
          baselineType: TextBaseline.alphabetic,
          child: Text(description),
        ),
        space(0, 5),
        Baseline(
          baseline: 20.0,
          baselineType: TextBaseline.alphabetic,
          child: InkWell(
              onTap: onTap,
              child: Text(
                name,
                style:
                    getBoldStyle(fontSize: 16, color: AppColors.primaryColor),
              )),
        ),
      ],
    );
  }
}
