import 'dart:convert';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List data = [];

Future<String> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://nameless-fortress-98131.herokuapp.com/dealer/state'));
  data = jsonDecode(response.body);
  return "success";
}

class DealerHomePage extends StatefulWidget {
  const DealerHomePage(
      {Key, key, required this.megadata, required this.usernamedata})
      : super(key: key);

  final String megadata;
  final String usernamedata;

  @override
  _DealerHomePageState createState() => _DealerHomePageState();
}

class _DealerHomePageState extends State<DealerHomePage> {
  String countryValue = "";
  String stateValue = " ";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usernamedata),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            child: Column(
              children: [
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  flagState: CountryFlag.DISABLE,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",
                  dropdownDialogRadius: 10.0,
                  searchBarRadius: 10.0,
                  onCountryChanged: (dynamic value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value!;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value!;
                    });
                  },
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: const Text("Print Data")),
                Text(address)
              ],
            )),
      ),
    );
  }
}
