import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/option_button_list.dart';
import 'package:eaki/models/queue_number.dart';
import 'package:eaki/pages/appointment_type_page.dart';
import 'package:eaki/pages/go_to_room_23_page.dart';
import 'package:eaki/pages/request_hc_number_page.dart';
import 'package:eaki/viewmodels/queue_number_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisitPurposePage extends ConsumerWidget {
  final String previousOption;

  const VisitPurposePage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "O que você veio fazer hoje?",
      centralWidget: OptionButtonList(
        options: [
          OptionButton(
            text: "Consulta",
            onPressed: () {
              ref.read(queueNumberVM).updateVisitPurpose(VisitPurpose.appointment);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppointmentTypePage(previousOption: "Consulta"),
                ),
              );
            },
          ),
          OptionButton(
            text: "Curativo, medicamento ou outro procedimento",
            onPressed: () {
              ref.read(queueNumberVM).updateVisitPurpose(VisitPurpose.procedure);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RequestHCNumberPage(previousOption: 'Curativo, medicamento ou outro procedimento')),
              );
            },
          ),
          OptionButton(
            text: "Outro",
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoToRoom23Page()),
              )
            },
          ),
        ],
      ),
    );
  }
}
