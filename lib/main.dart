import 'package:eaki/components/option_tile_list.dart';
import 'package:eaki/firebase_options.dart';
import 'package:eaki/pages/pick_number_page.dart';
import 'package:eaki/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: EakiMainWidget()));
}

class EakiMainWidget extends StatelessWidget {
  const EakiMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Eaki',
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomePage(),
          'number': (context) => const PickNumberPage(),
        },
        theme: ThemeData(
          primaryColor: const Color(0xff0E4DA4),
          errorColor: const Color(0xffE74C3C),
          scaffoldBackgroundColor: const Color(0xF9FFFFFF),
          fontFamily: "Inter",
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff263238),
            ),
            headline4: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.w600,
              color: Color(0xff263238),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff263238),
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              color: Color(0xff263238),
              fontWeight: FontWeight.w400,
            ),
            bodyText2: TextStyle(
              fontSize: 14,
              color: Color(0xff767171),
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
            ),
          ),
        ),
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
