import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/App_images.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/functions/valid.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../../../../core/shared/custom_elevatedbutton.dart';
import '../../../../core/shared/custom_textformfield.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../manager/cubit/auth_cubit.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
      key: cubit.scaffoldKeyNewPass,
      appBar: const CustomAppBar(
        isTitle: false,
        iconBack: true,
        title: "New Password",
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is NewPassLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is NewPassFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is NewPassSuccessState) {}
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: cubit.newPassKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(
                              height: 280,
                              AppImages.newPassImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          space(20, 0),
                          Text("Enter the New Password",
                              style: Theme.of(context).textTheme.titleLarge),
                          space(20, 0),
                          CustomTextFormField(
                            controller: cubit.passControllerRegister,
                            validator: (v) {
                              return validInput(v!, 8, 255);
                            },
                            obscureText: true,
                            hintText: "Enter your password",
                            label: "password",
                          ),
                          space(15, 0),
                          CustomTextFormField(
                            controller: cubit.passRepeatControllerRegister,
                            validator: (v) {
                              return validInput(v!, 8, 255);
                            },
                            obscureText: true,
                            hintText: "Repeat password",
                            label: "R-password",
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    name: "Submit",
                    onPressed: () {
                      cubit.newPassword();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
