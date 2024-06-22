import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landingagea/features/home/presentation/widgets/project_card.dart';
import '../../../../core/functions/show_loading_indicator_f.unction.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../../../../dashboard/customAppBar.dart';
import '../../manager/cubit/home_cubit.dart';

class ViewProjects extends StatelessWidget {
  const ViewProjects({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of(context);
    return Scaffold(
      appBar: customAppBar(context: context, title: "View Projects"),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AllProjectLoadingState) {
            return showLoadingIndicator(context);
          } else if (state is AllProjectFailedState) {
            Navigator.pop(context);
            showToast(msg: state.msg);
          } else if (state is AllProjectSuccessState) {
            cubit.projectsList = state.model;
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: cubit.projectsList.length,
            itemBuilder: (context, i) {
              return InkWell(
                  onTap: () {
                    cubit.getProjectDetails(cubit.projectsList[i].id);
                    AppDialog(context, cubit.projectsList[i].name,
                        cubit.projectsList[i].details);
                  },
                  child: ProjectCard(model: cubit.projectsList[i]));
            },
          );
        },
      ),
    );
  }
}
