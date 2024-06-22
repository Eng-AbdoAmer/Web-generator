import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landingagea/features/home/presentation/widgets/drawer_card.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../manager/cubit/home_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);
    return Drawer(
      elevation: 100,
      backgroundColor: AppColors.grey3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            space(20, 0),
            DrawerCard(
                icon: Icons.person, name: cubit.userNameValue, onTap: () {}),
            space(20, 0),
            DrawerCard(
                icon: Icons.email, name: cubit.userEmailValue, onTap: () {}),
            space(20, 0),
            DrawerCard(
                icon: Icons.account_circle_outlined,
                name: "ContactUs",
                onTap: () {
                  cubit.contactUs();
                }),
            DrawerCard(
                icon: Icons.file_copy_outlined,
                name: "AboutUs",
                onTap: () {
                  cubit.aboutUs();
                }),
            DrawerCard(
                icon: Icons.logout,
                name: "Logout",
                onTap: () {
                  cubit.logout();
                }),
          ],
        ),
      ),
    );
  }
}
