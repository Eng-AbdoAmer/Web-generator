validInput(String val, int min, int max) {
  if (val.length > max) {
    return "required this failed mor than$max";
  }
  if (val.length < min) {
    return "required this failed less than$min";
  }
  if (val.isEmpty) {
    return "required this failed is Not Empty";
  }
}

String? validEmail(String val) {
  if (val.isEmpty) {
    return "Email is required and cannot be empty";
  }
  String pattern =
      '^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(val)) {
    return "Invalid email format";
  }
  return null;
}

String? validPhone(String val) {
  if (val.isEmpty) {
    return "Phone number is required and cannot be empty";
  }

  String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(val)) {
    return "Invalid phone number format";
  }
  return null;
}
