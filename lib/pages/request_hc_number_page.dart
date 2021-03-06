import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/open_text_input.dart';
import 'package:eaki/pages/is_preferential_page.dart';
import 'package:eaki/pages/request_name_page.dart';
import 'package:eaki/providers/queue_number_provider.dart';
import 'package:eaki/viewmodels/queue_number_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestHCNumberPage extends ConsumerWidget {
  final String previousOption;
  final _formKey = GlobalKey<FormState>();

  RequestHCNumberPage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "Qual seu número HC?",
      onAdvance: () {
        final hcNumber = ref.read(queueNumberDTOProvider).hcNumber;
        if (hcNumber != null && hcNumber.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IsPreferentialPage(
                previousOption: 'Número HC',
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Por favor, preencha o campo!")));
        }
      },
      notMappedButton: NotMappedButton(
        text: "Não sei meu número HC",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RequestNamePage(previousOption: "Não sei meu número HC"),
            ),
          );
        },
      ),
      centralWidget: OpenTextInput(
        key: _formKey,
        labelText: "Número HC",
        onFieldSubmitted: (value) => {ref.read(queueNumberVM).updateHCNumber(value)},
        onFieldChanged: (value) => {ref.read(queueNumberVM).updateHCNumber(value)},
      ),
    );
  }
}
