import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../data/models/onboarding_model.dart';

Widget buildImageSlideshow(BuildContext context) {
  return SizedBox(
    child: ImageSlideshow(
      height: MediaQuery.of(context).size.height - 150,
      width: double.infinity,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      children: buildSlideshowPages(),
      onPageChanged: (value) {},
      autoPlayInterval: 10000,
      isLoop: true,
    ),
  );
}
