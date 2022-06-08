import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpenTextInput extends ConsumerWidget {
  final GlobalKey<FormState>? formKey;
  final String labelText;
  final void Function(String)? onFieldSubmitted;

  const OpenTextInput({
    this.formKey,
    required this.labelText,
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: TextFormField(
        key: formKey,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
