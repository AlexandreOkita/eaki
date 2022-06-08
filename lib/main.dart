import 'package:eaki/components/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: EakiMainWidget()));
}

class EakiMainWidget extends StatelessWidget {
  const EakiMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eaki',
      theme: ThemeData(
          primaryColor: const Color(0xff0E4DA4),
          fontFamily: "Inter",
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
              fontSize: 16,
              color: Color(0xff263238),
              fontWeight: FontWeight.w400,
            ),
          )),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Eaki")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screen.width * 0.1),
        child: Center(
          child: OptionButton(
            text: "Consulta Agendada",
            onPressed: () => print("aoba"),
          ),
        ),
      ),
    );
  }
}
