import 'package:eaki/components/advance_button.dart';
import 'package:eaki/components/eaki_scaffold.dart';
import 'package:eaki/components/not_mapped_button.dart';
import 'package:eaki/components/red_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenericFormPage extends ConsumerWidget {
  final String previousOption;
  final String question;
  final Widget centralWidget;
  final int inputFlex;
  final void Function()? onAdvance;
  final NotMappedButton? notMappedButton;
  const GenericFormPage({
    this.inputFlex = 2,
    this.onAdvance,
    required this.previousOption,
    required this.question,
    required this.centralWidget,
    this.notMappedButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return EakiScaffold(
      title: 'Questionário',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Você clicou em \"$previousOption\"", style: textTheme.bodyText2),
                const SizedBox(
                  height: 10,
                ),
                Text(question, style: textTheme.headline6),
              ],
            ),
          ),
          Flexible(
            flex: inputFlex,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: centralWidget,
                ),
                const SizedBox(height: 10),
                if (notMappedButton != null)
                  Flexible(
                    flex: 1,
                    child: notMappedButton!,
                  ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                onAdvance == null
                    ? Container()
                    : AdvanceButton(
                        onPressed: onAdvance,
                      ),
                const SizedBox(height: 10),
                RedBackButton(
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
