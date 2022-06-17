import 'package:eaki/components/eaki_scaffold.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/red_back_button.dart';
import 'package:eaki/pages/appointment_type_page.dart';
import 'package:eaki/pages/go_to_yellow_track_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstQuestionPage extends ConsumerWidget {
  const FirstQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;

    return EakiScaffold(
      title: "Questionário",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Bem vindo ao ambulatório de Pediatria!",
            style: textTheme.headline6,
          ),
          SizedBox(
            height: screen.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Você já se consultou no HC?",
                  style: textTheme.headline6,
                ),
                OptionButton(
                  text: "Já sou paciente do HC",
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AppointmentTypePage(previousOption: "Já sou paciente do HC"))),
                ),
                OptionButton(
                  text: "Minha primeira vez no HC",
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GoToYellowTrackPage())),
                ),
              ],
            ),
          ),
          RedBackButton(onPressed: () => print("aoba")),
        ],
      ),
    );
  }
}
