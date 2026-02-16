class UserModel {
  String id;
  String name;
  String email;
  int createdAt;

  UserModel({
     this.id="",
    required this.name,
    required this.email,
    required this.createdAt,
  });
}
