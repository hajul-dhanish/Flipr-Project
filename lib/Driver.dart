import 'package:flutter/material.dart';

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({Key? key, this.megadata, this.usernamedata})
      : super(key: key);
  final String? megadata;
  final String? usernamedata;

  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ready to ride?"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Row(
                  children: [
                    const Text("UserName :"),
                    const SizedBox(width: 6),
                    Text(widget.usernamedata!),
                  ],
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Register no :"),
                      const SizedBox(width: 6),
                      Text(widget.megadata!),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
