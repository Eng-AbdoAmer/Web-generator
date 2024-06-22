// import 'package:dio/dio.dart';

// import '../../../core/constant/app-links.dart';

// class ProjectWebServices {
//   BaseOptions options = BaseOptions(
//     baseUrl: AppLinks.baseUrl,
//     receiveDataWhenStatusError: true,
//     connectTimeout: const Duration(seconds: 3),
//     receiveTimeout: const Duration(seconds: 3),
//   );

//   Future<dynamic> getAllProjects() async {
//     try {
//       Response response = await Dio(options).get(AppLinks.allProjects);
//       print(response.data);
//       return response.data;
//     } on DioException catch (ex) {
//       return ex.message;
//     }
//   }
// }
