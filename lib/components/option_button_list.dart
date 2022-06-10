import 'package:eaki/components/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OptionButtonList extends ConsumerWidget {
  final List<OptionButton> options;
  const OptionButtonList({required this.options, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options,
    );
  }
}
