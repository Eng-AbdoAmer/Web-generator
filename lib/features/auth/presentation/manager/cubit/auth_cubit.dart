import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landingagea/core/constant/app-links.dart';
import 'package:landingagea/features/auth/presentation/pages/new_password.dart';
import 'package:landingagea/features/auth/presentation/pages/otp_page.dart';
import 'package:landingagea/features/home/presentation/pages/homePage.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  var scaffoldKeyLogin = GlobalKey<ScaffoldState>();
  var scaffoldKeyOtp = GlobalKey<ScaffoldState>();
  var scaffoldKeyRegister = GlobalKey<ScaffoldState>();
  var scaffoldKeyForgetPass = GlobalKey<ScaffoldState>();
  var scaffoldKeyNewPass = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey();
  GlobalKey<FormState> registerKey = GlobalKey();
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> otpKey = GlobalKey();
  GlobalKey<FormState> newPassKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController newPassRepeatController = TextEditingController();
  TextEditingController nameControllerRegister = TextEditingController();
  TextEditingController emailControllerRegister = TextEditingController();
  TextEditingController passControllerRegister = TextEditingController();
  TextEditingController passRepeatControllerRegister = TextEditingController();

  Future<void> login() async {
    if (loginKey.currentState?.validate() ?? false) {
      emit(SignInLoadingState());
      try {
        final response = await Dio().post(
          AppLinks.login,
          data: {
            "email": emailController.value.text,
            "password": passController.value.text,
          },
        );
        emit(SignInSuccessState());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('Token', response.data['access_token']);
        Get.off(const HomePage());
      } catch (e) {
        emit(SignInFailedState(msg: e.toString()));
      }
    }
  }

  Future<void> register() async {
    if (registerKey.currentState?.validate() ?? false) {
      emit(RegisterLoadingState());
      try {
        print(AppLinks.register);
        final response = await Dio().post(
          AppLinks.register,
          data: {
            "name": nameControllerRegister.value.text,
            "email": emailControllerRegister.value.text,
            "password": passControllerRegister.value.text,
            "password_confirmation": passRepeatControllerRegister.value.text,
          },
        );
        emit(RegisterSuccessState());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('Token', response.data['access_token']);
        Get.off(() => const HomePage());
      } catch (e) {
        print(e.toString());
        emit(RegisterFailedState(msg: e.toString()));
      }
    }
  }



  Future forgetPassword() async {
    Get.to(const NewPasswordScreen());
  }

  Future newPassword() async {
    Get.to(const OtpScreen());
  }

  Future otp() async {}
}
