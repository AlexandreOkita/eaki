import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/option_button_list.dart';
import 'package:eaki/pages/choose_specialty_page.dart';
import 'package:eaki/pages/go_to_room_23_page.dart';
import 'package:eaki/pages/go_to_yellow_track_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppointmentTypePage extends ConsumerWidget {
  final String previousOption;

  const AppointmentTypePage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "Tipo de Consulta:",
      notMappedButton: NotMappedButton(
        text: "Não tenho agendamento",
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GoToRoom23Page(),
              ))
        },
      ),
      centralWidget: OptionButtonList(
        options: [
          OptionButton(
            text: "Consulta Agendada ou Retorno",
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseSpecialtyPage(previousOption: "Consulta Agendada ou Retorno"),
                ),
              ),
            },
          ),
          OptionButton(
            text: "Encaixe com email",
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoToYellowTrackPage()),
              )
            },
          ),
        ],
      ),
    );
  }
}
