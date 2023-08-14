class UserModel {
  String email;
  String name;
  String? photoUrl;
  String uid;

  UserModel({
    required this.email,
    required this.name,
    this.photoUrl,
    required this.uid,
  });
}
