import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotMappedButton extends ConsumerWidget {
  final void Function()? onPressed;
  final String text;

  const NotMappedButton({this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      hoverColor: const Color(0x103A76CA),
      onTap: () => onPressed,
      child: Text(text, style: textTheme.caption),
    );
  }
}
