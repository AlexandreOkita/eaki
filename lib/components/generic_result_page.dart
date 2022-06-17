import 'package:eaki/components/advance_button.dart';
import 'package:eaki/components/eaki_scaffold.dart';
import 'package:eaki/components/red_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenericResultPage extends ConsumerWidget {
  final String pageTitle;
  final String mainText;
  final String secondaryText;
  final Text dataText;
  final void Function()? onAdvance;
  final void Function()? onBack;
  const GenericResultPage({
    this.onAdvance,
    this.onBack,
    required this.dataText,
    required this.mainText,
    required this.secondaryText,
    required this.pageTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return EakiScaffold(
        title: pageTitle,
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(mainText, style: textTheme.headline4),
                      const SizedBox(height: 10),
                      dataText,
                    ],
                  ),
                  Text(
                    secondaryText,
                    style: textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onAdvance != null) AdvanceButton(onPressed: onAdvance),
                  if (onAdvance != null && onBack != null) const SizedBox(height: 10),
                  if (onBack != null) RedBackButton(onPressed: onBack),
                ],
              ),
            )
          ],
        ));
  }
}
