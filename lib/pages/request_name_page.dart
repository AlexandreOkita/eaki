import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/open_text_input.dart';
import 'package:eaki/pages/is_preferential_page.dart';
import 'package:eaki/viewmodels/queue_number_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestNamePage extends ConsumerWidget {
  final String previousOption;

  const RequestNamePage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "Qual seu nome completo?",
      onAdvance: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IsPreferentialPage(
              previousOption: 'Nome Completo',
            ),
          ),
        ),
      },
      centralWidget: OpenTextInput(
        labelText: "Nome e Sobrenome",
        onFieldSubmitted: (value) => {ref.read(queueNumberVM).updateName(value)},
        onFieldChanged: (value) => {ref.read(queueNumberVM).updateName(value)},
      ),
    );
  }
}
