import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  var host = "http://127.0.0.1:8000/api";
  var token = "";
  var mode = "debug"; // debug or live
  var headers = {
    'Accept': 'application/json',
  };
  login(email, password) async {
    if (mode == "debug") {
      return {
        "access_token":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTU3OTM5MTIsImV4cCI6MTcxNTc5NzUxMiwibmJmIjoxNzE1NzkzOTEyLCJqdGkiOiJlSGltekxMM05sTjB6SjQ5Iiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.lON2vyfOCxuwWae8vNoT9h0Xqd5USQCr7zRLUFEIN5M",
        "token_type": "bearer",
        "expires_in": 3600
      };
    }
    var request = http.MultipartRequest('POST', Uri.parse('$host/auth/login'));
    request.fields.addAll({'email': email, 'password': password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();



    if (response.statusCode == 200) {
      var responseInJson = jsonDecode(await response.stream.bytesToString());
      token = responseInJson['access_token'];
      return responseInJson;
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  register(name, email, password) async {
    if (mode == "debug") {
      return {
        "access_token":
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2F1dGgvcmVnaXN0b3IiLCJpYXQiOjE3MTU4NzU4NTQsImV4cCI6MTcxNTg3OTQ1NCwibmJmIjoxNzE1ODc1ODU0LCJqdGkiOiI0RXpkNXpNQndRUVpJelFGIiwic3ViIjoiOCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.R7FJnDVlK_FLSQLW0blEvFtOK8zrcKzsxjCIDtQJbnk",
        "token_type": "bearer",
        "expires_in": 3600
      };
    }
    var request =
    http.MultipartRequest('POST', Uri.parse('$host/auth/registor'));
    request.fields.addAll({
      'email': email,
      'password': password,
      'password_confirmation': password,
      'name': name
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  logout() async {
    var request =
    http.Request('POST', Uri.parse('$host/auth/logout?token=$token'));

    if (mode == "debug") {
      return {"message": "Successfully logged out"};
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  me() async {
    var request = http.Request('POST', Uri.parse('$host/auth/me?token=$token'));

    if (mode == "debug") {
      return {
        "id": 1,
        "name": "Qandil abdel fadil awayn",
        "email": "qandilafa@gmail.com",
        "email_verified_at": null,
        "available_projects": 118,
        "created_at": "2023-11-28T15:07:30.000000Z",
        "updated_at": "2024-05-14T18:04:27.000000Z"
      };
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  refresh() async {
    var request =
    http.Request('POST', Uri.parse('$host/auth/refresh?token=$token'));

    if (mode == "debug") {
      return {
        "id": 1,
        "name": "Qandil abdel fadil awayn",
        "email": "qandilafa@gmail.com",
        "email_verified_at": null,
        "available_projects": 118,
        "created_at": "2023-11-28T15:07:30.000000Z",
        "updated_at": "2024-05-14T18:04:27.000000Z"
      };
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  allProjects() async {
    var request =
    http.Request('GET', Uri.parse('$host/project/all?token=$token'));
    if (mode == "debug") {
      return [
        {
          "id": "live6643a7a8e68be",
          "name": "wqewqe",
          "details": "Give brief about your idea ....ewqewq",
          "user_id": 1,
          "theme_name": "METRONIC",
          "status": 3,
          "image_url":
          "/storage/images/vcPzNnRItXvoZTc62AIqJ1fEHzmObq7NPLO1vYEC.jpg",
          "type": "portfolio",
          "created_at": "2024-05-14T18:04:24.000000Z",
          "updated_at": "2024-05-14T18:07:39.000000Z"
        }
      ];
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  findProject() async {
    var request = http.Request(
        'GET', Uri.parse('$host/project/find/live6643a7a8e68be?token=$token'));
    if (mode == "debug") {
      return {
        "id": "live6643a7a8e68be",
        "name": "wqewqe",
        "details": "Give brief about your idea ....ewqewq",
        "user_id": 1,
        "theme_name": "METRONIC",
        "status": 3,
        "image_url":
        "/storage/images/vcPzNnRItXvoZTc62AIqJ1fEHzmObq7NPLO1vYEC.jpg",
        "type": "portfolio",
        "created_at": "2024-05-14T18:04:24.000000Z",
        "updated_at": "2024-05-14T18:07:39.000000Z"
      };
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  /// @var theme two types = [ubold, metronic]
  /// @var type two types = [portfolio, ecommerce]
  createProject(name, details, theme, type, imagePath) async {
    if (mode == "debug") {
      return {"error": false, "message": "created successfully."};
    }
    var request = http.MultipartRequest(
        'POST', Uri.parse('$host/project/create?token=$token'));
    request.fields.addAll(
        {'name': name, 'details': details, 'theme': theme, 'type': type});
    request.files.add(await http.MultipartFile.fromPath('avatar', imagePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  exportProject(projectId) async {
    if (mode == "debug") {
      return {
        "url":
        "http://127.0.0.1:8000/Outputs/live6643a7a8e68be-2024-05-14 18:07:39.zip"
      };
    }
    var request = http.Request('GET',
        Uri.parse('$host/project/live6643a7a8e68be/export?token=$token'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }

  deleteProject(projectId) async {
    if (mode == "debug") {
      return {"error": false, "message": "deleted successfully."};
    }
    var request = http.Request('POST',
        Uri.parse('$host/project/live664503d096f6a/delete?token=$token'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      return {"error": true, "message": (response.reasonPhrase)};
    }
  }
}
