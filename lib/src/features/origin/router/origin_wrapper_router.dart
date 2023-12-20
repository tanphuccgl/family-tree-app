import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class OriginWrapperPage extends StatelessWidget {
  const OriginWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
