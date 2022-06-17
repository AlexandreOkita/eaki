import 'package:eaki/components/generic_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickNumberPage extends ConsumerWidget {
  const PickNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return GenericResultPage(
      dataText: Text(
        "203",
        style: textTheme.headline1,
      ),
      mainText: 'Sua senha é',
      pageTitle: 'Senha',
      secondaryText: 'Aguarde ser chamado na tela da recepção.',
      onAdvance: () => {},
    );
  }
}
