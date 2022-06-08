import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RedBackButton extends ConsumerWidget {
  final void Function()? onPressed;

  const RedBackButton({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: theme.errorColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("VOLTAR", style: theme.textTheme.button),
          ],
        ),
      ),
    );
  }
}
