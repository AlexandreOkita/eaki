import 'package:eaki/components/eaki_scaffold.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/option_button.dart';
import 'package:eaki/components/red_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenericOptionFormPage extends ConsumerWidget {
  final String previousOption;
  final String question;
  final List<OptionButton> options;
  final NotMappedButton? notMappedButton;
  const GenericOptionFormPage({
    required this.previousOption,
    required this.question,
    required this.options,
    this.notMappedButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;
    return EakiScaffold(
      title: 'Questionário',
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Você clicou em \"$previousOption\"", style: textTheme.bodyText2),
                const SizedBox(
                  height: 10,
                ),
                Text(question, style: textTheme.headline6),
              ],
            ),
            SizedBox(
              height: screen.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [...options, notMappedButton == null ? Container() : notMappedButton!],
              ),
            ),
            RedBackButton(
              onPressed: () => print("aoba"),
            ),
          ],
        ),
      ),
    );
  }
}
