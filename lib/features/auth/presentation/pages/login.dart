import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:landingagea/features/auth/presentation/pages/forgetPass.dart';
import 'package:landingagea/features/auth/presentation/pages/register.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
        key: cubit.scaffoldKeyLogin,
        appBar: const CustomAppBar(isTitle: false, iconBack: false),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignInLoadingState) {
              return showLoadingIndicator(context);
            } else if (state is SignInFailedState) {
              Navigator.pop(context);
              showToast(msg: state.msg);
            } else if (state is SignInSuccessState) {}
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: cubit.loginKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          AppImages.loginImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      space(10, 0),
                      Text("Fast Efficient and Productive",
                          style: Theme.of(context).textTheme.titleLarge),
                      space(10, 0),
                      CustomTextFormField(
                          controller: cubit.emailController,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            return validInput(v!, 3, 255);
                          },
                          icon: Icons.email_outlined,
                          hintText: "Enter your email address",
                          label: "Email"),
                      space(15, 0),
                      CustomTextFormField(
                        controller: cubit.passController,
                        validator: (v) {
                          return validInput(v!, 3, 255);
                        },
                        obscureText: true,
                        hintText: "Enter your password",
                        label: "password",
                      ),
                      space(15, 0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.to(const ForgetPasswordScreen());
                              // navigateTo(page: const ForgetPassword());
                            },
                            child: Text(
                              "Forget Password?",
                              style: Theme.of(context).textTheme.titleSmall,
                            )),
                      ),
                      space(15, 0),
                      CustomElevatedButton(
                          name: "Login",
                          onPressed: () {
                            cubit.login();
                          }),
                      space(10, 0),
                      CustomAuthRow(
                        name: 'Sign Up',
                        description: 'Not a Member yet?',
                        onTap: () {
                          Get.off(const RegisterScreen());
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
