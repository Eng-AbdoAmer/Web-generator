import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import 'package:landingagea/core/constant/styles_manager.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';
import 'package:landingagea/core/shared/custom_elevatedbutton.dart';
import 'package:landingagea/features/home/manager/cubit/home_cubit.dart';
import 'package:landingagea/features/home/presentation/widgets/addLogo.dart';
import 'package:landingagea/features/home/presentation/widgets/optionsCard.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/functions/valid.dart';
import '../../../../core/shared/custom_textformfield.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../../../../dashboard/customAppBar.dart';

class AddProject extends StatelessWidget {
  const AddProject({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);
    return Scaffold(
      appBar: customAppBar(context: context, title: "Add Project"),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddProjectLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is AddProjectFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is AllProjectSuccessState) {}
        },
        builder: (context, state) {
          return Form(
            key: cubit.addProjectKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Form",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    space(15, 0),
                    Text("upload project Logo",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    const AddLogo(),
                    space(15, 0),
                    Text("project Name",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    space(15, 0),
                    CustomTextFormField(
                      controller: cubit.nameProjectController,
                      validator: (v) {
                        return validInput(v!, 3, 255);
                      },
                      hintText: "Enter your Project Name",
                      label: "Project Name",
                    ),
                    space(15, 0),
                    Text("Choose a Theme",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    space(15, 0),
                    OptionsCard(
                      icon: Icons.work,
                      title: "Metronic",
                      subtitle: "Themes",
                      onTap: () {
                        cubit.selectTheme("Metronic");
                      },
                    ),
                    space(15, 0),
                    OptionsCard(
                      icon: Icons.work,
                      title: "ubold",
                      subtitle: "Themes",
                      onTap: () {
                        cubit.selectTheme("ubold");
                      },
                    ),
                    space(15, 0),
                    Text("Choose Web Type",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    space(15, 0),
                    OptionsCard(
                      icon: Icons.shopping_cart,
                      title: "E-Commerce Project",
                      subtitle: "E-Commerce Website",
                      onTap: () {
                        cubit.selectWebType("ecommerce");
                      },
                    ),
                    space(15, 0),
                    OptionsCard(
                      icon: Icons.perm_identity_outlined,
                      title: "Portfolio",
                      subtitle: "static website with a database",
                      onTap: () {
                        cubit.selectWebType("portfolio");
                      },
                    ),
                    space(15, 0),
                    Text("Details",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    space(15, 0),
                    CustomTextFormField(
                      controller: cubit.detailsProjectController,
                      maxLines: 10,
                      validator: (v) {
                        return validInput(v!, 3, 255);
                      },
                      hintText: "Enter your Description",
                      label: "Description",
                    ),
                    space(15, 0),
                    Text("Agree to Terms And Conditions",
                        style: getMediumStyle(
                            color: AppColors.lightBlack, fontSize: 16)),
                    space(15, 0),
                    Row(
                      children: [
                        BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return Checkbox(
                                value: cubit.checkboxValue,
                                onChanged: (v) {
                                  cubit.toggleCheckboxValue(v!);
                                });
                          },
                        ),
                        Text("I Agree to Terms And Conditions",
                            style: getMediumStyle(
                                color: AppColors.lightBlack, fontSize: 16))
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: CustomElevatedButton(
                                name: "Discard", onPressed: () {})),
                        space(0, 5),
                        Expanded(
                            child: CustomElevatedButton(
                                name: "Submit",
                                onPressed: () {
                                  cubit.addProject();
                                })),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
