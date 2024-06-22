import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:landingagea/core/constant/App_images.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';
import '../../../../core/shared/custom_app_bar.dart';
import '../widgets/developerList.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        iconBack: true,
        title: "About Us Page",
        isTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppImages.aboutUs,
                fit: BoxFit.cover,
              ),
              space(20, 0),
              Text(
                "Welcome to Web Hybrid At Web Hybrid, we specialize in providing individuals and businesses with the tools they need to create stunning websites effortlessly. Whether you're a seasoned professional or a complete beginner, our platform is designed to streamline the website creation process, allowing you to bring your vision to life with ease.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              space(15, 0),
              Text(
                  "Our mission is to empower individuals and businesses to establish their online presence quickly and effectively. We understand the importance of having a professional and engaging website in today's digital age, and we're committed to making the process accessible to everyone, regardless of their technical expertise.",
                  style: Theme.of(context).textTheme.titleMedium),
              space(15, 0),
              Text(
                  "User-Friendly Interface: We believe that creating a website should be a straightforward and enjoyable experience.",
                  style: Theme.of(context).textTheme.titleMedium),
              space(15, 0),
              Text(
                  "That's why our platform features an intuitive interface that guides you through every step of the process. Customization Options: We understand that every website is unique, which is why we offer a wide range of customization options.",
                  style: Theme.of(context).textTheme.titleMedium),
              space(15, 0),
              Text(
                  "From customizable templates to advanced design tools, you have the flexibility to create a website that perfectly reflects your brand. Responsive Support: Our dedicated support team is here to help you every step of the way. Whether you have a question about a feature or need assistance troubleshooting an issue, we're always just a click away.",
                  style: Theme.of(context).textTheme.titleMedium),
              space(25, 0),
              Text("Our Great Team",
                  style: Theme.of(context).textTheme.titleLarge),
              space(15, 0),
              ImageSlideshow(
                height: 400,
                width: double.infinity,
                initialPage: 0,
                indicatorColor: AppColors.primaryColor,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {},
                autoPlayInterval: 10000,
                isLoop: true,
                children: buildSlideDeveloper(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
