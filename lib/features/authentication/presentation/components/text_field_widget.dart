import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool isObscureText;
  const TextFieldWidget(
      {Key? key,
        required this.controller,
        required this.text,
        required this.isObscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueGrey.withOpacity(0.4),
            border: Border.all(color: Colors.blueGrey.withOpacity(0.7))),
        child: TextField(
          controller: controller,
          obscureText: isObscureText,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            suffixIcon: isObscureText == true
                ? IconButton(
                onPressed: () {}, icon: const Icon(Icons.remove_red_eye))
                : const SizedBox(),
            hintStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ));
  }
}
