import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const XButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(size.width, 50),
              elevation: 2,
              backgroundColor: XColors.primary2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12)),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
