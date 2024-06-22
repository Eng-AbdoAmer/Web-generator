import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:landingagea/features/auth/presentation/pages/login.dart';
import '../../../../core/constant/App_images.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/functions/valid.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../../../../core/shared/custom_elevatedbutton.dart';
import '../../../../core/shared/custom_textformfield.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../manager/cubit/auth_cubit.dart';
import '../widgets/row_not_member.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
        key: cubit.scaffoldKeyRegister,
        appBar: const CustomAppBar(isTitle: false, iconBack: false),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              return showLoadingIndicator(context);
            } else if (state is RegisterFailedState) {
              Navigator.pop(context);
              showToast(msg: state.msg);
            } else if (state is RegisterSuccessState) {}
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: cubit.registerKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          height: 280,
                          AppImages.registerImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      space(10, 0),
                      Text("Fast Efficient and Productive",
                          style: Theme.of(context).textTheme.titleLarge),
                      space(10, 0),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.nameControllerRegister,
                          validator: (v) {
                            return validInput(v!, 3, 255);
                          },
                          icon: Icons.email_outlined,
                          hintText: "Enter your Name",
                          label: "Name"),
                      space(15, 0),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.emailControllerRegister,
                          obscureText: false,
                          validator: (v) {
                            return validInput(v!, 3, 255);
                          },
                          icon: Icons.email_outlined,
                          hintText: "Enter your email address",
                          label: "Email"),
                      space(15, 0),
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
                      space(15, 0),
                      CustomElevatedButton(
                          name: "Sign Up",
                          onPressed: () {
                            cubit.register();
                          }),
                      space(10, 0),
                      CustomAuthRow(
                        name: 'Sign In',
                        description: 'Already have an Account?',
                        onTap: () {
                          Get.off(const LoginScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
