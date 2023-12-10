import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_rich.dart';
import '../logic/create_individual_f0_female_bloc.dart';

class FamilyCodeF0FemaleWidget extends StatelessWidget {
  const FamilyCodeF0FemaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0FemaleBloc,
        CreateIndividualF0FemaleState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Family code"),
            GapHelper.h20,
            XInput(
              value: state.familyCode,
              errorText: state.isFamilyCodeExist == true ? "Đã tồn tại" : "",
              onChanged: (value) => context
                  .read<CreateIndividualF0FemaleBloc>()
                  .onChangedFamilyCode(value),
            ),
          ],
        );
      },
    );
  }
}
