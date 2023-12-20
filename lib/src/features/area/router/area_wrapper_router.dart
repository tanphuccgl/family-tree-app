import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AreaWrapperPage extends StatelessWidget {
  const AreaWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
