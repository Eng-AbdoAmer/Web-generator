import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../../../core/shared/custom_elevatedbutton.dart';
import '../../../auth/presentation/pages/login.dart';
import '../widgets/buildImageSlideshow.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildImageSlideshow(context),
              space(25, 0),
              CustomElevatedButton(
                  name: "Skip",
                  onPressed: () {
                    Get.off(const LoginScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
