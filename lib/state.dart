import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String state;

  const Album({
    required this.userId,
    required this.id,
    required this.state,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      state: json['state'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load file');
  }
}
// Future<List<ProductDataModel>> ReadJsonData() async {
//   final jsondata =
//       // await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
//       await 
//   final list = json.decode(jsondata) as List<dynamic>;

//   //map json and initialize using DataModel
//   return list.map((e) => ProductDataModel.fromJson(e)).toList();
// }
