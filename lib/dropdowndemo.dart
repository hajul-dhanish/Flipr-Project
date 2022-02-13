import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DealerHomePage extends StatefulWidget {
  const DealerHomePage({Key? key, this.megadata, this.usernamedata})
      : super(key: key);
  final String? megadata;
  final String? usernamedata;
  @override
  _DealerHomePageState createState() => _DealerHomePageState();
}

List data = [];

Future<String> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://nameless-fortress-98131.herokuapp.com/dealer/state'));
  data = jsonDecode(response.body);
  return "success";
}

List demo = [
  {"id": 1, "state": "tamil nadu"},
  {"id": 2, "state": "delhi"},
  {"id": 3, "state": "kerala"}
];

class _DealerHomePageState extends State<DealerHomePage> {
  dynamic dropdownvalue = 'tamil nadu';

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: DropdownButton(
            value: dropdownvalue,
            onTap: () {},
            hint: const Text("data"),
            items: data.map((data) {
              return DropdownMenuItem(
                child: Text(data['state']),
                value: data["_id"],
              );
            }).toList(),
            onChanged: (dynamic newValue) {
              setState(() {
                dropdownvalue = newValue;
              });
            }),
      )),
    );
  }
}
