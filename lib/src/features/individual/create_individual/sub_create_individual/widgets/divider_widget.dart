import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 2,
      color: Colors.grey,
    );
  }
}
