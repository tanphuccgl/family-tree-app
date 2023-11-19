import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';

class XButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  const XButton2({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: XColors.primary2,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
