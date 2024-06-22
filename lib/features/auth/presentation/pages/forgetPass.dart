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

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
      key: cubit.scaffoldKeyForgetPass,
      appBar: const CustomAppBar(
        isTitle: false,
        iconBack: true,
        title: "Forget Password",
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgetPassLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is ForgetPassFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is ForgetPassSuccessState) {}
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: cubit.forgetPasswordKey,
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
                              AppImages.forgetPasswordImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          space(20, 0),
                          Text("Forget Password",
                              style: Theme.of(context).textTheme.titleLarge),
                          space(30, 0),
                          CustomTextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: cubit.emailController,
                            obscureText: false,
                            validator: (v) {
                              return validInput(v!, 3, 255);
                            },
                            icon: Icons.email_outlined,
                            hintText: "Enter your email address",
                            label: "Email",
                          ),
                          space(20, 0),
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    name: "Submit",
                    onPressed: () {
                      cubit.forgetPassword();
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
