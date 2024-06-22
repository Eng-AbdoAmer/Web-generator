import 'package:flutter/material.dart';
import 'package:landingagea/core/constant/App_images.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../../../core/services/hexagonClipper.dart';

List<Widget> buildSlideDeveloper() {
  final List<Map<String, String>> Team = [
    {
      'image': AppImages.user2,
      'name': "Qandil Abdel Fadil",
      'job': "Backend Devloper(Team Leader)"
    },
    {
      'image': AppImages.user1,
      'name': "abdelmeseh mohesen",
      'job': "Full Stack Devloper"
    },
    {
      'image': AppImages.user3,
      'name': "Marwan Raafat ",
      'job': "Mobile Application Devloper"
    },
    {'image': AppImages.user4, 'name': "Hamed Hamdy", 'job': "Ai Devloper"},
    {
      'image': AppImages.user5,
      'name': "Abdullah Gamal",
      'job': "Front End Developer"
    },
  ];

  return Team.map((page) {
    return Column(
      children: [
        // ClipRRect(
        //   borderRadius:
        //       BorderRadius.circular(10), // adjust the radius to your liking
        //   child: Image.asset(
        //     page['image']!,
        //     height: 250,
        //     fit: BoxFit.fitWidth,
        //   ),
        // ),
        ClipPath(
          clipper: HexagonClipper(),
          child: Image.asset(
            page['image']!,
            height: 260,
            width: 260,
            fit: BoxFit.fitWidth,
          ),
        ),
        space(10, 0),
        Text(
          page['name']!,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        space(10, 0),
        Text(
          page['job']!,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }).toList();
}
