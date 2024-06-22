part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFailedState extends HomeState {
  final String msg;

  HomeFailedState({required this.msg});
}

class HomeSuccessState extends HomeState {}

class HomeChangeCheckBoxState extends HomeState {
  final bool checkboxValue;
  HomeChangeCheckBoxState({required this.checkboxValue});
}

////////////////////////////////// logout////
class LogOutLoadingState extends HomeState {}

class LogOutFailedState extends HomeState {
  final String msg;

  LogOutFailedState({required this.msg});
}

class LogOutSuccessState extends HomeState {}

///////////////////  AllProject //
class AllProjectLoadingState extends HomeState {}

class AllProjectFailedState extends HomeState {
  final String msg;

  AllProjectFailedState({required this.msg});
}

class AllProjectSuccessState extends HomeState {
  final List<ProjectsModel> model;

  AllProjectSuccessState({required this.model});
}

//################### Project Details #################
class ProjectDetailsLoadingState extends HomeState {}

class ProjectDetailsFailedState extends HomeState {
  final String msg;

  ProjectDetailsFailedState({required this.msg});
}

class ProjectDetailsSuccessState extends HomeState {
  final ProjectsModel model;

  ProjectDetailsSuccessState({required this.model});
}

//################### Add Project  #################
class AddProjectLoadingState extends HomeState {}

class AddProjectFailedState extends HomeState {
  final String msg;

  AddProjectFailedState({required this.msg});
}

class AddProjectSuccessState extends HomeState {}

class SelectThemeState extends HomeState {
  final String title;

  SelectThemeState({required this.title});
}

class ChooseWebType extends HomeState {
  final String title;

  ChooseWebType({required this.title});
}

//################### Project Delete #################
class DeleteProjectLoadingState extends HomeState {}

class DeleteProjectFailedState extends HomeState {
  final String msg;

  DeleteProjectFailedState({required this.msg});
}

class DeleteProjectSuccessState extends HomeState {}

class SetImageSuccessState extends HomeState {}

//###################  ProfileDetails #################
class ProfileDetailsLoadingState extends HomeState {}

class ProfileDetailsFailedState extends HomeState {
  final String msg;

  ProfileDetailsFailedState({required this.msg});
}

class ProfileDetailsSuccessState extends HomeState {}

//################### Export Project #################
class ExportProjectLoadingState extends HomeState {}

class ExportProjectFailedState extends HomeState {
  final String msg;

  ExportProjectFailedState({required this.msg});
}

class ExportProjectSuccessState extends HomeState {
  final String url;

  ExportProjectSuccessState({required this.url});
}
