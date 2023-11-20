import 'package:flutter/material.dart';

class XTextRich extends StatelessWidget {
  final String text;
  const XTextRich({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: " *",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
