class ProfileModel {
  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.availableProjects,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null emailVerifiedAt;
  late final int availableProjects;
  late final String createdAt;
  late final String updatedAt;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = null;
    availableProjects = json['available_projects'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
