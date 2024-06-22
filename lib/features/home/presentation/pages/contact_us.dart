import 'package:flutter/material.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';
import 'package:landingagea/core/shared/custom_app_bar.dart';
import 'package:landingagea/core/shared/custom_elevatedbutton.dart';
import 'package:landingagea/core/shared/custom_textformfield.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/styles_manager.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconBack: true,
        title: "Contact Us Page",
        isTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space(10, 0),
                Text("Send Us Email",
                    style:
                        getMediumStyle(color: AppColors.black, fontSize: 18)),
                space(20, 0),
                CustomTextFormField(
                    hintText: "Enter Your Name",
                    icon: Icons.person,
                    keyboardType: TextInputType.name,
                    label: "Name"),
                space(20, 0),
                CustomTextFormField(
                    hintText: "Enter Your Email",
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email"),
                space(20, 0),
                CustomTextFormField(
                    hintText: "Enter Your Subject",
                    icon: Icons.subject,
                    keyboardType: TextInputType.text,
                    label: "Subject"),
                space(20, 0),
                CustomTextFormField(
                  hintText: "Enter Your Message",
                  icon: Icons.message,
                  keyboardType: TextInputType.text,
                  label: "Message",
                  maxLines: 10,
                ),
                space(30, 0),
                CustomElevatedButton(
                  name: "Send feedback",
                  onPressed: () {},
                )
              ],
            ),
          )),
    );
  }
}
