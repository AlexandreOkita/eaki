import 'package:eaki/components/generic_result_page.dart';
import 'package:eaki/providers/queue_number_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PickNumberPage extends ConsumerWidget {
  const PickNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ref.watch(queueNumberGeneratorProvider).when(
          loading: (() => const Center(child: CircularProgressIndicator())),
          error: (e, st) {
            return Scaffold(
              body: Center(
                child: Text("$e\n$st"),
              ),
            );
          },
          data: (data) => GenericResultPage(
            dataText: Text(
              data.number.toString(),
              style: textTheme.headline1,
            ),
            mainText: 'Sua senha é',
            pageTitle: 'Senha',
            secondaryText: 'Aguarde ser chamado na tela da recepção.',
            onAdvance: () => {},
          ),
        );
  }
}
