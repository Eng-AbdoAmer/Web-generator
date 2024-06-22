class ProjectsModel {
  ProjectsModel({
    required this.id,
    required this.name,
    required this.details,
    required this.userId,
    required this.themeName,
    required this.status,
    required this.imageUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String details;
  late final int userId;
  late final String themeName;
  late final int status;
  late final String imageUrl;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    userId = json['user_id'];
    themeName = json['theme_name'];
    status = json['status'];
    imageUrl = json['image_url'] ??
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Floading-icon-png&psig=AOvVaw3ebLBt205khysktZEKcRSi&ust=1718894123802000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMCO2uDx54YDFQAAAAAdAAAAABAE";
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
