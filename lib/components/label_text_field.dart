import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget {
  final String labelText;
  final String? hintText, errorText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onSubmitted, onChanged;

  const LabelTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.errorText,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          style: const TextStyle(fontWeight: FontWeight.bold),
          focusNode: focusNode,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            errorText: errorText,
            hintText: hintText,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(37, 150, 190, 1),
              ),
            ),
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
