import 'package:flutter/material.dart';

void main() {
  runApp(const EakiMainWidget());
}

class EakiMainWidget extends StatelessWidget {
  const EakiMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eaki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eaki")),
      body: const Center(child: Text("Home")),
    );
  }
}
