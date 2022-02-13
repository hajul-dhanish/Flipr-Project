// import 'dart:convert';

// class Profile {
//   int id;
//   String name;
//   double price;
//   int quantity;

//   Profile(
//       {required this.id,
//       required this.name,
//       required this.price,
//       required this.quantity});

//   factory Profile.fromJson(Map<String, dynamic> map) {
//     return Profile(
//         id: map["id"] as int,
//         name: map["name"] as String,
//         price: map["price"] as double,
//         quantity: map["quantity"] as int);
//   }

//   Map<String, dynamic> toJson() {
//     return {"id": id, "name": name, "price": price, "quantity": quantity};
//   }
// }

// List<Profile> profileFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
// }

// String profileToJson(Profile data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }
