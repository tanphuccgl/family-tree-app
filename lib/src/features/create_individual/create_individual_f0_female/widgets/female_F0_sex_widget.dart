import 'package:familytree/src/features/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';

import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FemaleF0SexWidget extends StatelessWidget {
  const FemaleF0SexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0FemaleBloc,
        CreateIndividualF0FemaleState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Giới tính"),
            GapHelper.h20,
            XInput(
              value: "Cái",
              readOnly: true,
            ),
          ],
        );
      },
    );
  }
}
