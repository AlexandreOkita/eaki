import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/option_button_list.dart';
import 'package:eaki/pages/pick_number_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsPreferentialPage extends ConsumerWidget {
  final String previousOption;

  const IsPreferentialPage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericFormPage(
      previousOption: previousOption,
      question: "Escolha o tipo de senha:",
      centralWidget: OptionButtonList(
        options: [
          OptionButton(
            text: "Senha Não Preferencial",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PickNumberPage(),
                ),
              );
            },
          ),
          OptionButton(
            text: "Senha Preferencial",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PickNumberPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
