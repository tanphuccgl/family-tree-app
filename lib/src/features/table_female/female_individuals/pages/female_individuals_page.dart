import 'package:familytree/src/features/table_female/female_individuals/pages/body_female_individuals.dart';

import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/female_individuals_bloc.dart';

class FemaleIndividualsPage extends StatelessWidget {
  const FemaleIndividualsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FemaleIndividualsBloc(context),
      child: BlocBuilder<FemaleIndividualsBloc, FemaleIndividualsState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: XColors.primary8,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lứa cá thể cái",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 40),
                  Expanded(child: BodyFemaleIndividuals())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
