class UserModel{
  late String firstName;
  late String lastName;
  late String imageUrl;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  // named constructor
  UserModel.fromJson(Map<String, dynamic> json)
  {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }

}