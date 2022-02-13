import 'dart:convert';

import 'package:fliprproject/Dealer.dart';
import 'package:fliprproject/api_service.dart';
import 'package:flutter/material.dart';
import 'Driver.dart';
import 'data.dart';
import 'themes.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const String SiteName = "Dealer Wala";
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: CustomBG,
        scaffoldBackgroundColor: CustomSBG,
        canvasColor: CustomBG,
      ),
      title: SiteName,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppBar,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.traffic,
                color: Colors.red,
              ),
              Text(
                'Dealer',
                style: TextStyle(color: Color.fromARGB(255, 173, 156, 0)),
              ),
              Text(
                'Wala',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        body: const InitialPage(),
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DriverRegister()));
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://cdn130.picsart.com/305146130100201.jpg",
                    ),
                  ),
                  const Text(
                    "What is this?",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DealerRegister()));
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://i.pinimg.com/736x/cb/fa/63/cbfa6357158f0f3bde4ffcc8761aeb9d.jpg",
                    ),
                  ),
                  const Text(
                    "New User? \nRegister here",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrpLC91C3B3zG3sApDXBrUQaguxLQI_dwAE4oC1aHWl39UqDD7tXhwwHB9v_qIC7FHBsE&usqp=CAU",
                    ),
                  ),
                  const Text(
                    "An Exsisting user \nLog In",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://i.imgur.com/nTJc9st.jpg",
                    ),
                  ),
                  const Text(
                    "Technical Support",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://cutewallpaper.org/22/depressing-anime-pfp-wallpapers/2979618024.jpg",
                    ),
                  ),
                  const Text(
                    "Contact Admin",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                showAlertDialog(context);
              },
              child: SizedBox(
                child: Stack(alignment: Alignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                      "https://i.pinimg.com/550x/2f/cd/49/2fcd492cdcb0118c6c2b4692cf2a805f.jpg",
                    ),
                  ),
                  const Text(
                    "About Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Dealer Registration page
class DealerRegister extends StatefulWidget {
  const DealerRegister({Key? key, megaData}) : super(key: key);

  @override
  _DealerRegisterState createState() => _DealerRegisterState();
}

final _formKey = GlobalKey<FormState>();

// List<String> _typeuser = [
//   // "Dealer",
//   "Driver",
// ];

String typeuser = "Dealer";

class _DealerRegisterState extends State<DealerRegister> {
  // late DataModel _dataModel;
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenocontoller = TextEditingController();
  TextEditingController typeusercontroller = TextEditingController();
  TextEditingController phonenoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dealer Registration"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                controller: userController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Create Username as Your Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'create password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phonenoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your contact number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // TextFormField(
              //   controller: typeusercontroller,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Driver or Dealer',
              //   ),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter';
              //     }
              //     return null;
              //   },
              // ),
              ////
              Row(
                children: [
                  const Text(
                    "Selec from this shit: ",
                  ),
                  const SizedBox(width: 10),
                  //
                  DropdownButton<String>(
                    onTap: () {},
                    value: typeuser,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? newValue) {
                      setState(() {
                        typeuser = newValue!;
                      });
                    },
                    items: <String>['Dealer', 'Driver']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  //
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String email = emailController.text;
                    String password = passwordController.text;
                    String username = userController.text;
                    String typeuser = typeusercontroller.text;
                    String phoneno = phonenoController.text;

                    setState(() async {
                      postRequest(username, email, phoneno, password, typeuser)
                          .then((value) {
                        final Map<String, dynamic> data =
                            json.decode(value.body);
                        final String userid = data["userid"].toString();
                        final String username = data["username"];
                        // print(value.body);
                        if (data["code"] == 100 &&
                            _formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Registered Succefully')),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => typeuser == "Driver"
                                    ? DriverHomePage(
                                        megadata: userid,
                                        usernamedata: username,
                                      )
                                    : DealerHomePage(
                                        megadata: userid,
                                        usernamedata: username,
                                      )),
                          );
                        }
                      });
                    });
                  },
                  child: const Text('Register'),
                ),
              ),
            ]),
          ),
        ));
  }
}

//usage medium Page
class DriverRegister extends StatefulWidget {
  const DriverRegister({Key? key}) : super(key: key);

  @override
  _DriverRegisterState createState() => _DriverRegisterState();
}

class _DriverRegisterState extends State<DriverRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What is this?"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "The Shit we are doing for hackathon are whatever",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

//Working on it dialogue
showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: CustomSBG,
    title: const Text("Working in it"),
    content: const Text("Coming Soon...."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
