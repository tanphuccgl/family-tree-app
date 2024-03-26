import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/table_female/table_female/logic/table_female_state.dart';
import 'package:familytree/src/features/table_female/table_female/page/body_table_female.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableFemalePage extends StatelessWidget {
  final String individualId;
  const TableFemalePage({
    super.key,
    @PathParam('individualId') required this.individualId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TableFemaleBloc(individualId),
      child: BlocBuilder<TableFemaleBloc, TableFemaleState>(
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
                  Expanded(child: BodyTableFemale())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
