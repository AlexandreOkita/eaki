import 'package:eaki/components/generic_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoToRoom23Page extends ConsumerWidget {
  const GoToRoom23Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return GenericResultPage(
      dataText: Text(
        "Sala 23",
        style: textTheme.headline1,
      ),
      mainText: 'Dirija-se para',
      pageTitle: 'Direcionamento',
      secondaryText: 'Faça seu cadastro no HC no mesmo andar do ambulatório de pediatria.',
      onAdvance: () => {},
    );
  }
}
