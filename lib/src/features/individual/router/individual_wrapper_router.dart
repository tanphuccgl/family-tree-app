import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class IndividualWrapperPage extends StatelessWidget {
  const IndividualWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoRouter(),
    );
  }
}
