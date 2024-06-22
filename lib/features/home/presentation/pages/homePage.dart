import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';
import 'package:landingagea/features/home/manager/cubit/home_cubit.dart';
import 'package:landingagea/features/home/presentation/pages/addProject.dart';
import 'package:landingagea/features/home/presentation/widgets/custom_drawer.dart';
import '../../../../core/constant/styles_manager.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../widgets/activeProjectCard.dart';
import '../../../../dashboard/customAppBar.dart';
import '../widgets/professionalCard.dart';
import '../widgets/buildViewProjectsButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: const Color(0xffEFF1F3),
      appBar: customAppBar(context: context, title: "Projects Dashboard"),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is HomeFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is HomeSuccessState) {}
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  space(10, 0),
                  Text(
                    "Home / Dashboard",
                    style: getRegularStyle(
                        color: AppColors.lightBlack, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  space(10, 0),
                  const ActiveProjectsCard(),
                  space(20, 0),
                  const ProfessionalsCard(),
                  space(20, 0),
                  BuildProjectsButton(
                      title: "Add Project",
                      onPressed: () {
                        Get.to(const AddProject());
                      }),
                  space(20, 0),
                  BuildProjectsButton(
                      title: "View Projects",
                      onPressed: () {
                        cubit.viewAllProject();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
