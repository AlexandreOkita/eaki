import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionButton extends ConsumerWidget {
  final void Function()? onPressed;
  final String text;

  const OptionButton({required this.text, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  text,
                  style: textTheme.bodyText1,
                  overflow: TextOverflow.clip,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff263238),
              ),
            ],
          ),
        ));
  }
}
