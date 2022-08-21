// class LoginModel
// {
//   late String type;
//   late String message;
//   late Data data;
//
//   LoginModel.fromJson(Map<String, dynamic> json)
//   {
//     type = json['status'];
//     message = json['message'];
//     data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
//   }
// }
//

class Data {
  late UserData user;
  late String accessToken;
  late String refreshToken;

  // named constructor
  Data.fromJson(Map<String, dynamic> json)
  {
    user = (json['user'] != null ? UserData.fromJson(json['user']) : null)!;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class UserData {
  late String userId;
  late String firstName;
  late String lastName;
  late String email;
  late String imageUrl;
  late String? address;
  late String role;


  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
  }
}