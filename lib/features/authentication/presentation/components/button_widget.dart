import 'dart:math';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function(double e) onPressed;
  final String text;
  const ButtonWidget({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              fixedSize: Size(size.width, size.height * 0.06),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: () {
            onPressed(e);
          },
          child: Text(text)),
    );
  }
}
