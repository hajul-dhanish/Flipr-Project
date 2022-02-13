import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneno,
    required this.password,
    required this.typeuser,
  });

  var id;
  String username;
  String email;
  String phoneno;
  String password;
  String typeuser;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        phoneno: json["phoneno"],
        password: json["password"],
        typeuser: json["typeuser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phoneno": phoneno,
        "password": password,
        "typeuser": typeuser,
      };
}
