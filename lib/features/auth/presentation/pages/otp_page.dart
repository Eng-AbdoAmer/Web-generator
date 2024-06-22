import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import '../../../../core/constant/App_images.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/functions/valid.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../../../../core/shared/custom_elevatedbutton.dart';
import '../../../../core/shared/custom_textformfield.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../manager/cubit/auth_cubit.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
      key: cubit.scaffoldKeyOtp,
      appBar: const CustomAppBar(
        isTitle: false,
        iconBack: true,
        title: "Forget Password",
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is OtpLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is OtpFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is OtpSuccessState) {}
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: cubit.otpKey,
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
                          Text("OTP Verification",
                              style: Theme.of(context).textTheme.titleLarge),
                          space(30, 0),
                          OtpTextField(
                            numberOfFields: 5,
                            borderColor: AppColors.primaryColor,

                            showFieldAsBox: true,

                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },

                            onSubmit: (String verificationCode) {
                              print(verificationCode);
                            }, // end onSubmit
                          ),
                          space(20, 0),
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    name: "Submit",
                    onPressed: () {
                      cubit.otp();
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
