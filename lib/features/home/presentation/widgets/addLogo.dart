import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_colors.dart';
import '../../manager/cubit/home_cubit.dart';

class AddLogo extends StatelessWidget {
  const AddLogo({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: 180,
          width: 200,
          decoration: BoxDecoration(
              color: AppColors.grey2, borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orangeAccent,
                  Colors.pinkAccent,
                ],
              ),
            ),
            child: const Center(
              child: Text(
                '9',
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 30,
            ),
            color: AppColors.lightBlack,
            onPressed: () {
              cubit.pickImageFromGallery();
            },
          ),
        ),
      ],
    );
  }
}
