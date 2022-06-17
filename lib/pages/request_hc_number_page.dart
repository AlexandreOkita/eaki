import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/open_text_input.dart';
import 'package:eaki/pages/pick_number_page.dart';
import 'package:eaki/pages/request_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestHCNumberPage extends ConsumerWidget {
  final String previousOption;

  const RequestHCNumberPage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "Qual seu número HC?",
      onAdvance: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PickNumberPage(),
          ),
        ),
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
        labelText: "Número HC",
        onFieldSubmitted: (value) => {},
      ),
    );
  }
}
