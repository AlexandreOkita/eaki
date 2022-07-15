import 'package:eaki/components/generic_result_page.dart';
import 'package:eaki/pages/first_question_page.dart';
import 'package:eaki/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/advance_button.dart';
import '../components/eaki_scaffold.dart';

class SpecialityNotFoundPage extends ConsumerWidget {
  const SpecialityNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return EakiScaffold(
        title: "Especialidade Não Encontrada",
        body: Column(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                            "Infelizmente não encontramos a sua especialdiade",
                            style: textTheme.headline4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/sad.png',
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdvanceButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const WelcomePage())))
                          }),
                ],
              ),
            )
          ],
        ));
  }
}
