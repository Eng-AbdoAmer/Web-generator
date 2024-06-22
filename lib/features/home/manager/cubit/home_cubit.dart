import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landingagea/core/constant/app-links.dart';
import 'package:landingagea/features/home/models/projects_model.dart';
import 'package:landingagea/features/home/presentation/pages/about_us.dart';
import 'package:landingagea/features/home/presentation/pages/contact_us.dart';
import 'package:landingagea/features/home/presentation/pages/webViewScreen.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/shared/helper_meuthods.dart';
import '../../presentation/pages/homePage.dart';
import '../../presentation/pages/viewProjects.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<ProjectsModel> projectsList = [];
  TextEditingController nameProjectController = TextEditingController();
  TextEditingController detailsProjectController = TextEditingController();
  GlobalKey<FormState> addProjectKey = GlobalKey();

  bool checkboxValue = false;
  String selectThemeValue = "";
  String selectWebTypeValue = "";
  String userNameValue = "";
  String userEmailValue = "";

  Color getStatusColor(String status) {
    switch (status) {
      case 'in progress':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      case 'Completed':
        return Colors.green;
      case 'overdue':
        return Colors.red;
      default:
        return Colors.black; // Default color if status is unknown
    }
  }

  void toggleCheckboxValue(bool value) {
    print(value);
    checkboxValue = value;
    emit(HomeChangeCheckBoxState(checkboxValue: value));
  }

  void selectTheme(String theme) {
    selectThemeValue = theme;
    emit(SelectThemeState(title: theme));
    print(selectThemeValue);
  }

  void selectWebType(String value) {
    selectWebTypeValue = value;
    emit(ChooseWebType(title: value));
    print(selectWebTypeValue);
  }

  viewAllProject() async {
    projectsList = [];
    emit(AllProjectLoadingState());
    final pref = await SharedPreferences.getInstance();
    String accessToken = await pref.getString('Token') ?? "";
    try {
      final response = await dio.Dio()
          .get(AppLinks.allProjects, queryParameters: {"token": accessToken});
      Get.to(const ViewProjects());

      List<dynamic> jsonList = response.data;
      jsonList.forEach((element) {
        projectsList.add(ProjectsModel.fromJson(element));
      });
      emit(AllProjectSuccessState(model: projectsList));
    } catch (e) {
      emit(AllProjectFailedState(msg: e.toString()));
    }
  }

  Future getProjectDetails(String id) async {
    emit(ProjectDetailsLoadingState());
    final pref = await SharedPreferences.getInstance();
    String accessToken = await pref.getString('Token') ?? "";
    try {
      final response = await dio.Dio().get("${AppLinks.findProject}/${id}",
          queryParameters: {"token": accessToken});
      emit(ProjectDetailsSuccessState(
          model: ProjectsModel.fromJson(response.data)));
    } catch (e) {
      emit(ProjectDetailsFailedState(msg: e.toString()));
    }
  }

  Future getProfileDetails() async {
    final pref = await SharedPreferences.getInstance();
    String accessToken = await pref.getString('Token') ?? "";
    try {
      emit(ProfileDetailsLoadingState());
      final response = await dio.Dio()
          .post(AppLinks.profile, queryParameters: {"token": accessToken});
      print(response.data.toString());
      userNameValue = response.data['name'];
      userEmailValue = response.data['email'];
      emit(ProfileDetailsSuccessState());
    } catch (e) {
      print(e.toString());
      emit(ProfileDetailsFailedState(msg: e.toString()));
    }
  }

  Future exportProject() async {
    final pref = await SharedPreferences.getInstance();
    String accessToken = await pref.getString('Token') ?? "";
    try {
      emit(ExportProjectLoadingState());
      final response = await dio.Dio()
          .get(AppLinks.exportProject, queryParameters: {"token": accessToken});
      print(response.data.toString());
      print(response.data['url']);
      emit(ExportProjectSuccessState(url: response.data['url']));
      Get.to(WebViewScreen(url: response.data['url']));
    } catch (e) {
      print(e.toString());
      emit(ExportProjectFailedState(msg: e.toString()));
    }
  }

  Future logout() async {
    emit(LogOutLoadingState());
    final pref = await SharedPreferences.getInstance();
    String accessToken = await pref.getString('Token') ?? "";
    try {
      final response = await dio.Dio()
          .post(AppLinks.logout, queryParameters: {"token": accessToken});
      emit(LogOutSuccessState());
      await pref.remove('Token'); // Remove the token
      SystemNavigator.pop(); // Exit the app
      // Get.off(const ());
    } catch (e) {
      emit(LogOutFailedState(msg: e.toString()));
    }
  }

  contactUs() {
    Get.to(const ContactUs());
  }

  aboutUs() {
    Get.to(const AboutUs());
  }

  Future deleteProject(String id) async {
    print("${AppLinks.deleteProject}/$id/delete");
    emit(DeleteProjectLoadingState());
    final pref = await SharedPreferences.getInstance();
    String accessToken = pref.getString('Token') ?? "";

    try {
      final response = await dio.Dio().post(
        "${AppLinks.deleteProject}/$id/delete",
        queryParameters: {"token": accessToken},
      );

      if (response.data['message'] == "deleted successfully.") {
        showToast(msg: "Project deleted successfully", isError: false);
        emit(DeleteProjectSuccessState());
        Get.off(const HomePage());
      } else {
        emit(DeleteProjectFailedState(
            msg: response.data['message'] ?? "Unknown error"));
        print(response.data['message']);
      }
    } catch (e) {
      print(e.toString());
      emit(DeleteProjectFailedState(msg: e.toString()));
    }
  }

  Future<void> addProject() async {
    if (addProjectKey.currentState?.validate() ?? false) {
      dio.Dio dioClient = dio.Dio();

      dioClient.options.headers['Accept'] = 'application/json';

      final pref = await SharedPreferences.getInstance();
      String accessToken = pref.getString('Token') ?? "";
      String url =
          'https://smsclothes.com/api/project/create?token=$accessToken';

      if (selectImageFile == null) {
        print('No image selected.');
        emit(AddProjectFailedState(msg: 'No image selected.'));
        return;
      }

      try {
        emit(AddProjectLoadingState());
        dio.FormData formData = dio.FormData.fromMap({
          'name': nameProjectController.value.text,
          'details': detailsProjectController.value.text,
          'theme': selectThemeValue,
          'type': selectWebTypeValue,
          'avatar': await dio.MultipartFile.fromFile(selectImageFile!.path),
        });

        // Post form data
        dio.Response response = await dioClient.post(url, data: formData);

        if (response.statusCode == 200) {
          emit(AddProjectSuccessState());
          Get.to(const HomePage());
          print(response.data);
        } else {
          emit(AddProjectFailedState(msg: 'Error: ${response.statusMessage}'));
          print('Error: ${response.statusMessage}');
          print('Response data: ${response.data}');
        }
      } catch (e) {
        if (e is dio.DioException) {
          emit(AddProjectFailedState(
              msg: 'Error: DioException [${e.type}]: ${e.message}'));
          print('Error: DioException [${e.type}]: ${e.message}');
          if (e.response != null) {
            emit(AddProjectFailedState(
                msg: 'Response data: ${e.response!.data}'));
            print('Response data: ${e.response!.data}');
          }
        } else {
          emit(AddProjectFailedState(msg: 'Response data: ${e.toString()}'));
          print('Error: $e');
        }
      }
    }
  }

  File? selectImageFile;

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    selectImageFile = File(pickedImage.path);
    emit(SetImageSuccessState());
  }
}
