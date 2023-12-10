import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_rich.dart';

class AreaF0FemaleWidget extends StatelessWidget {
  const AreaF0FemaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0FemaleBloc,
        CreateIndividualF0FemaleState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Khu vực"),
            GapHelper.h20,
            XInput(
              value: state.area!.name + " ( ${state.area!.nameId} )",
              readOnly: true,
            ),
          ],
        );
      },
    );
  }
}
