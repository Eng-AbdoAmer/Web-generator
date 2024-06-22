import 'package:flutter/material.dart';
import 'package:landingagea/core/constant/App_images.dart';
import 'package:landingagea/core/constant/app_colors.dart';

AppBar customAppBar({required BuildContext context, required String title}) {
  return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leadingWidth: 120,
      // leading: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Image.asset(
      //       AppImages.homeIconImg,
      //       width: 50,
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(
      //         Icons.menu,
      //         color: AppColors.grey2,
      //         size: 35,
      //       ),
      //     )
      //   ],
      // ),
      actions: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            AppImages.profileImg,
            width: 50,
          ),
        )
      ],
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ));
}
