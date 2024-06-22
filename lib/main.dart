import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landingagea/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:landingagea/features/home/manager/cubit/home_cubit.dart';
import 'package:landingagea/features/onboarding_splash/presentation/pages/boardingPage.dart';
import 'config/bloc_observer/bloc_observer.dart';
import 'core/shared/helper_meuthods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()..getProfileDetails(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const BoardingPage(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
