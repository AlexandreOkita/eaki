import 'package:eaki/components/generic_form_page.dart';
import 'package:eaki/components/option_tile_list.dart';
import 'package:eaki/pages/error_screen.dart';
import 'package:eaki/pages/loading_screen.dart';
import 'package:eaki/pages/request_hc_number_page.dart';
import 'package:eaki/providers/specialty_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseSpecialtyPage extends ConsumerWidget {
  final String previousOption;
  final chosenSpecialtyProvider = StateProvider.autoDispose<String>((ref) => "");
  ChooseSpecialtyPage({required this.previousOption, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosenSpecialty = ref.watch(chosenSpecialtyProvider);
    return ref.watch(getCurrentSpecialtiesProvider).when(
        loading: () => const LoadingScreen(),
        error: (e, st) => ErrorScreen(st, e),
        data: (data) => GenericFormPage(
              inputFlex: 5,
              onAdvance: chosenSpecialty != ""
                  ? () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RequestHCNumberPage(previousOption: "Escolher Especialidade"),
                          ),
                        )
                      }
                  : null,
              previousOption: previousOption,
              question: "Selecione a especialidade:",
              centralWidget: OptionTileList(
                  provider: chosenSpecialtyProvider, items: data.map((e) => e.name).toList()),
            ));
  }
}
