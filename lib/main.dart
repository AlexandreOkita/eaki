import 'package:eaki/components/advance_button.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/open_text_input.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/option_tile_list.dart';
import 'package:eaki/components/red_back_button.dart';
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
        errorColor: const Color(0xffE74C3C),
        fontFamily: "Inter",
        textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
              fontSize: 16,
              color: Color(0xff263238),
              fontWeight: FontWeight.w400,
            ),
            button: TextStyle(
              fontSize: 14,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
            ),
            caption: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xff3A76CA),
              fontSize: 14,
            )),
      ),
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
        child: const Center(
          child: OptionTileList(
            items: ['Otorrino', 'Pediatra', 'Psicólogo', 'Médico'],
          ),
        ),
      ),
    );
  }
}
