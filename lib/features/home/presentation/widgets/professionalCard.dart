import 'package:flutter/material.dart';
import 'package:landingagea/core/constant/app_colors.dart';
import 'package:landingagea/core/constant/styles_manager.dart';
import 'package:landingagea/core/services/custom_sizebox.dart';

class ProfessionalsCard extends StatelessWidget {
  static const List colors = [
    Colors.red,
    Colors.yellow,
    Colors.teal,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.cyan,
  ];

  const ProfessionalsCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "375",
            style: getBoldStyle(color: AppColors.black, fontSize: 22),
          ),
          Text(
            "Professionals",
            style: getMediumStyle(color: AppColors.lightBlack, fontSize: 16),
          ),
          space(30, 0),
          Text(
            "Today's Heros",
            style: getBoldStyle(color: AppColors.black, fontSize: 22),
          ),
          space(10, 0),
          SizedBox(
            height: 70,
            child: Stack(children: [
              ...List.generate(
                  colors.length,
                  (index) => Positioned(
                      left: index * 33,
                      child: CircleAvatar(
                        backgroundColor: colors[index],
                        child: Text("A"),
                      )))
            ]),
          )
        ],
      ),
    );
  }
}
