import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> postRequest(String username, String email, int phoneno,
    String password, String typeuser) async {
  var url =
      Uri.parse('https://nameless-fortress-98131.herokuapp.com/user/register');

  Map data = {
    "id": 0,
    "username": username,
    "email": email,
    "phoneno": phoneno,
    "password": password,
    "typeuser": typeuser,
  };
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
  // print("${response.statusCode}");
  // print("${response.body}");
  return response;
}

void main() {
  postRequest("bas", "bas", 98877, "bas", "driver").then((value) {
    final Map<String, dynamic> data = json.decode(value.body);
    // print("${response.body}");
    print(data["code"]);
  });
}
