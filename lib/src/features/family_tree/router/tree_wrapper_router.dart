import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class TreeWrapperPage extends StatelessWidget {
  const TreeWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
