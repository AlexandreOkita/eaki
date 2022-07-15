import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OpenTextInput extends ConsumerWidget {
  final GlobalKey<FormState>? formKey;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onFieldChanged;

  const OpenTextInput({
    this.validator,
    this.formKey,
    required this.labelText,
    this.onFieldSubmitted,
    this.onFieldChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: TextFormField(
        key: formKey,
        validator: validator ?? _defaultValidator,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onFieldChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    print("aoba");
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
