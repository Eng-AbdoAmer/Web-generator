import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landingagea/features/home/models/projects_model.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/styles_manager.dart';
import '../../../../core/services/custom_sizebox.dart';
import '../../manager/cubit/home_cubit.dart';
import 'timeContainer.dart';

class ProjectCard extends StatelessWidget {
  final ProjectsModel model;
  const ProjectCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 360,
      width: double.infinity,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      model.imageUrl,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://img.freepik.com/free-vector/loading-circles-blue-gradient_78370-2646.jpg?w=740&t=st=1718808076~exp=1718808676~hmac=cbb141a6a02d005b83c324fc8f0c30145ca20b4cb27d8cfe2fcce6cce0ad7ab4',
                          fit: BoxFit.fitHeight,
                        );
                      },
                    ),
                  ),
                  // Text(
                  //   cubit.cardList[i]['textbutton']!,
                  //   style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: cubit.getStatusColor(
                  //         cubit.cardList[i]['textbutton']!,
                  //       )),
                  // ),
                ],
              ),
              space(20, 0),
              Text(
                model.name,
                style: getBoldStyle(color: AppColors.black, fontSize: 20),
              ),
              space(10, 0),
              Expanded(
                child: Text(
                  model.details,
                  style:
                      getMediumStyle(color: AppColors.lightBlack, fontSize: 12),
                ),
              ),
              space(10, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeContainer(
                    title: model.updatedAt.substring(0, 10),
                    des: "describe",
                  ),
                  TimeContainer(
                    title: model.createdAt.substring(0, 10),
                    des: 'budget',
                  ),
                ],
              ),
              space(10, 0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.edit),
                  //   style: IconButton.styleFrom(
                  //     backgroundColor:
                  //         AppColors.green, // Set the background color
                  //     shape:
                  //         const CircleBorder(), // Set the shape of the button
                  //     padding: const EdgeInsets.all(
                  //         16.0), // Set the padding of the button
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {
                      cubit.deleteProject(model.id);
                    },
                    icon: const Icon(Icons.delete),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.red, // Set the background color
                      shape:
                          const CircleBorder(), // Set the shape of the button
                      padding: const EdgeInsets.all(
                          16.0), // Set the padding of the button
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.exportProject();
                    },
                    icon: const Text("Export"),
                    style: IconButton.styleFrom(
                      backgroundColor:
                          AppColors.yellow, // Set the background color
                      shape:
                          const CircleBorder(), // Set the shape of the button
                      padding: const EdgeInsets.all(
                          16.0), // Set the padding of the button
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
