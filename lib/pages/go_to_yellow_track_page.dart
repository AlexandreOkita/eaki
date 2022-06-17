import 'package:eaki/components/generic_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoToYellowTrackPage extends ConsumerWidget {
  const GoToYellowTrackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericResultPage(
      dataText: const Text(
        "Faixa Amarela",
        style: TextStyle(color: Color(0xffADA718), fontSize: 24),
      ),
      mainText: 'Dirija-se para',
      pageTitle: 'Direcionamento',
      secondaryText: 'Faça seu cadastro no HC no mesmo andar do ambulatório de pediatria.',
      onAdvance: () => {},
      onBack: () => {},
    );
  }
}
