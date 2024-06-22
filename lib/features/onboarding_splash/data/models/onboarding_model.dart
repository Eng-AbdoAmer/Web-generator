  import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/custom_sizebox.dart';

List<Widget> buildSlideshowPages() {
    final List<Map<String, String>> pages = [
      {
        'image': 'assets/images/6.svg',
        'text':
            "Simple and easy-to-use interface: The web generator features an intuitive user interface that allows users to create and customize their sites without requiring programming experience",
      },
      {
        'image': 'assets/images/7.svg',
        'text':
            "Ready-made templates: The web generator provides a set of ready-made templates and different designs that can be customized to suit the user's needs.",
      },
      {
        'image': 'assets/images/8.svg',
        'text':
            "Flexible customization: The web generator allows users to customize the design, content, colors, images, fonts, and more, to match the visual identity of the project or brand",
      },
      {
        'image': 'assets/images/9.svg',
        'text':
            "Responsive Design: The web generator allows you to create sites that are compatible with various devices and screens, including smartphones, tablets, and desktop computers",
      },
    ];

    return pages.map((page) {
      return Column(
        children: [
          space(60, 0),
          SvgPicture.asset(
            page['image']!,
            height: 250,
            fit: BoxFit.fitWidth,
          ),
          space(25, 0),
          Text(
            page['text']!,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }).toList();
  }